import Foundation

struct RefreshTokenRequest: Encodable {
    let token: String
}

struct RefreshTokenResponse: Decodable {
    let data: RefreshTokenResponseData
}

struct RefreshTokenResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}

struct RefreshTokenAction {
    weak var delegate: APIRequestDelegate?
    var refreshToken: String

    let route: String = "/account/refresh-token"
    let method: HTTPMethod = .post

    func call(completion: @escaping (RefreshTokenResponseData) -> Void) {
        APIRequest<RefreshTokenRequest, RefreshTokenResponse>.call(
            delegate,
            route: route,
            method: method,
            authorized: false,
            parameters: RefreshTokenRequest(token: refreshToken)
        ) { data in
            do {
                let response = try JSONDecoder().decode(
                    RefreshTokenResponse.self,
                    from: data
                )
                completion(response.data)
            } catch {
                delegate?.onError(message: "Response decoding error.")
            }
        }
    }
}
