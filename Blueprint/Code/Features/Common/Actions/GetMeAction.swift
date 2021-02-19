import Foundation

struct GetMeResponse: Decodable {
    let data: GetMeResponseData
}

struct GetMeResponseData: Decodable {
    let user: User
}

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    let isEmailVerified: Bool
    var birthDate: String?
    var gender: String?
    var height: Double?
    var weight: Double?
    var createdAt: String?
}

struct GetMeAction {
    weak var delegate: APIRequestDelegate?

    let route: String = "/me/"
    let method: HTTPMethod = .get

    func call(completion: @escaping (GetMeResponseData) -> Void) {
        APIRequest<EmptyRequest, GetMeResponse>.call(
            delegate,
            route: route,
            method: method
        ) { data in
            do {
                let response = try JSONDecoder().decode(
                    GetMeResponse.self,
                    from: data
                )
                completion(response.data)
            } catch {
                delegate?.onError(message: "Response decoding error.")
            }
        }
    }
}
