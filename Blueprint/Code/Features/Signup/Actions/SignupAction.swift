import Foundation

struct SignupRequest: Encodable {
    let username: String
    let password: String
    let email: String
}

struct SignupResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}

struct SignupAction {
    weak var delegate: APIRequestDelegate?
    var parameters: SignupRequest

    let route: String = "/signup"
    let method: HTTPMethod = .post

    func call(completion: @escaping (SignupResponse) -> Void) {

        if Mock.shared.isEnabled {
            return completion(SignupResponse(
                accessToken: "accessToken",
                refreshToken: "refreshToken"
            ))
        }

        APIRequest<SignupRequest, SignupResponse>.call(
            delegate,
            route: route,
            method: method,
            authorized: false,
            parameters: parameters
        ) { data in
            do {
                let response = try JSONDecoder().decode(
                    SignupResponse.self,
                    from: data
                )
                completion(response)
            } catch {
                delegate?.onError(error: APIError.jsonDecoder)
            }
        }
    }
}
