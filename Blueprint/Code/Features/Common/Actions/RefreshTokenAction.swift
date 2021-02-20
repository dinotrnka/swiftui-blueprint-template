import Foundation

struct RefreshTokenRequest: Encodable {
    let token: String
}

struct RefreshTokenResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}

struct RefreshTokenAction {
    weak var delegate: APIRequestDelegate?
    var parameters: RefreshTokenRequest

    let route: String = "/account/refresh-token"
    let method: HTTPMethod = .post

    func call(completion: @escaping (RefreshTokenResponse) -> Void) {

        if Mock.shared.isEnabled {
            completion(RefreshTokenResponse(
                        accessToken: "accessToken",
                        refreshToken: "refreshToken"
            ))
        }

        APIRequest<RefreshTokenRequest, RefreshTokenResponse>.call(
            delegate,
            route: route,
            method: method,
            authorized: false,
            parameters: parameters
        ) { data in
            do {
                let response = try JSONDecoder().decode(
                    RefreshTokenResponse.self,
                    from: data
                )
                completion(response)
            } catch {
                delegate?.onError(error: APIError.jsonDecoder)
            }
        }
    }
}
