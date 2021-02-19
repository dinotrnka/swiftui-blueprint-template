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
    func onError(message: String)
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
            delegate?.onError(message: "No network connection.")
            return
        }

        let url = "https://" + Configuration.get(.baseUrl) + route

        guard let urlComponent = URLComponents(string: url),
              let usableUrl = urlComponent.url else {
            delegate?.onError(message: "URL Failed!")
            return
        }

        var request = URLRequest(url: usableUrl)

        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        if let parameters = parameters {
            do {
                request.httpBody = try JSONEncoder().encode(parameters)
            } catch {
                delegate?.onError(message: "Request serialization error!")
            }
        }

        var needToRefreshToken = false

        if authorized {
          if let accessToken = Auth.shared.getAccessToken(),
            Auth.shared.validate(accessToken: accessToken) {
            request.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
          } else {
            needToRefreshToken = true
          }
        }

        if needToRefreshToken, let refreshToken = Auth.shared.getRefreshToken() {
            Auth.shared.refreshTokens(refreshToken: refreshToken) { newAccessToken in
                request.setValue("Bearer " + newAccessToken, forHTTPHeaderField: "Authorization")
                runTask(delegate, request: request, success: successCallback)
            }
        } else {
            runTask(delegate, request: request, success: successCallback)
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
                delegate?.onError(message: "HTTP Request error!")
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                successCallback(data)
            } else {
                delegate?.onError(message: "Response failed!")
            }
        }

        task?.resume()
    }
}
