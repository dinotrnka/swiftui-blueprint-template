import Foundation

struct GetMeResponse: Decodable {
    let user: User
}

struct User: Codable {
    let id: Int
    let username: String
    let email: String
}

struct GetMeAction {
    weak var delegate: APIRequestDelegate?

    let route: String = "/me/"
    let method: HTTPMethod = .get

    func call(completion: @escaping (GetMeResponse) -> Void) {

        if Mock.shared.isEnabled {
            completion(GetMeResponse(user: User(
                id: 1,
                username: "user",
                email: "user@sample.com"
            )))
        }

        APIRequest<EmptyRequest, GetMeResponse>.call(
            delegate,
            route: route,
            method: method,
            authorized: true
        ) { data in
            do {
                let response = try JSONDecoder().decode(
                    GetMeResponse.self,
                    from: data
                )
                completion(response)
            } catch {
                delegate?.onError(error: APIError.jsonDecoder)
            }
        }
    }
}
