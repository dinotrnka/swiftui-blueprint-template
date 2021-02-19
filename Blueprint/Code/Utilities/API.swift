import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

protocol APIRequestDelegate: class {
    func onError(message: String)
}

struct APIRequest<Parameters: Encodable, Model: Decodable> {

    typealias CompletionHandler = (Data) -> Void

    static func call (
        _ delegate: APIRequestDelegate? = nil,
        route: String,
        method: HTTPMethod,
        parameters: Parameters,
        success successCallback: @escaping CompletionHandler
    ) {
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

        do {
            let jsonData = try JSONEncoder().encode(parameters)
            request.httpBody = jsonData
        } catch {
            delegate?.onError(message: "Request serialization error!")
        }

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
