import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

struct EmptyRequest: Encodable {}
struct EmptyResponse: Decodable {}

protocol APIRequestDelegate: class {
    func onError(error: APIError)
}

struct APIRequest<Parameters: Encodable, Model: Decodable> {

    typealias CompletionHandler = (Data) -> Void

    static func call (
        _ delegate: APIRequestDelegate? = nil,
        route: String,
        method: HTTPMethod,
        authorized: Bool,
        parameters: Parameters? = nil,
        success successCallback: @escaping CompletionHandler
    ) {
        if !NetworkMonitor.shared.isReachable {
            delegate?.onError(error: .noInternet)
            return
        }

        let url = "https://" + Configuration.get(.baseUrl) + route

        guard let urlComponent = URLComponents(string: url),
              let usableUrl = urlComponent.url else {
            return
        }

        var request = URLRequest(url: usableUrl)

        request.httpMethod = method.rawValue
        request.addDefaultHeaders()

        if let parameters = parameters {
            do {
                request.httpBody = try JSONEncoder().encode(parameters)
            } catch {
                delegate?.onError(error: .jsonEncoder)
            }
        }

        if !authorized {
            runTask(delegate, request: request, success: successCallback)
            return
        }

        if let accessToken = Auth.shared.getAccessToken(),
           Auth.shared.validate(accessToken: accessToken) {

            request.addAuthorizationHeader(accessToken: accessToken)
            runTask(delegate, request: request, success: successCallback)

        } else {
            guard let refreshToken = Auth.shared.getRefreshToken() else {
                delegate?.onError(error: .refreshToken)
                return
            }

            Auth.shared.refreshTokens(refreshToken: refreshToken) { accessToken in
                request.addAuthorizationHeader(accessToken: accessToken)
                runTask(delegate, request: request, success: successCallback)
            }
        }
    }

    static func runTask(
        _ delegate: APIRequestDelegate? = nil,
        request: URLRequest,
        success successCallback: @escaping CompletionHandler
    ) {
        var task: URLSessionDataTask?

        task = URLSession.shared.dataTask(with: request) { data, response, error in
            defer { task = nil }

            if error != nil {
                delegate?.onError(error: .httpRequest)
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                successCallback(data)
            } else {
                delegate?.onError(error: .httpResponse)
            }
        }

        task?.resume()
    }
}
