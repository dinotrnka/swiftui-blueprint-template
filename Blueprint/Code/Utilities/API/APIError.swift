import Foundation

enum APIError: String, Error {
    case noInternet = "ErrorMessage.NoInternet"
    case jsonEncoder = "ErrorMessage.JsonEncoder"
    case jsonDecoder = "ErrorMessage.JsonDecoder"
    case refreshToken = "ErrorMessage.RefreshToken"
    case httpRequest = "ErrorMessage.HttpRequest"
    case httpResponse = "ErrorMessage.HttpResponse"

    var message: String {
        self.rawValue.localized
    }
}
