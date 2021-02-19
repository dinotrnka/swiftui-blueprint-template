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
    var route: String = "/account/refresh-token"
    var method: HTTPMethod = .post

    func call(completion: @escaping (RefreshTokenResponseData) -> Void) {
        APIRequest<RefreshTokenRequest, RefreshTokenResponse>.call(
            delegate,
            route: route,
            method: method,
            parameters: RefreshTokenRequest(token: refreshToken)
        ) { data in
            do {
                let response = try JSONDecoder().decode(
                    RefreshTokenResponse.self,
                    from: data
                )
                completion(response.data)
            } catch {
                print("Response decoding error.")
            }
        }
    }
}
