import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}

struct LoginAction {
    weak var delegate: APIRequestDelegate?
    var parameters: LoginRequest

    let route: String = "/login"
    let method: HTTPMethod = .post

    func call(completion: @escaping (LoginResponse) -> Void) {

        if Mock.shared.isEnabled {
            return completion(LoginResponse(
                accessToken: "accessToken",
                refreshToken: "refreshToken"
            ))
        }

        APIRequest<LoginRequest, LoginResponse>.call(
            delegate,
            route: route,
            method: method,
            authorized: false,
            parameters: parameters
        ) { data in
            do {
                let response = try JSONDecoder().decode(
                    LoginResponse.self,
                    from: data
                )
                completion(response)
            } catch {
                delegate?.onError(error: APIError.jsonDecoder)
            }
        }
    }
}
