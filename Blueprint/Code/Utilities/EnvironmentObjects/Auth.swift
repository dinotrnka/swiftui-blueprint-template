import Foundation
import SwiftKeychainWrapper

struct Credentials {
    var accessToken: String?
    var refreshToken: String?
}

class Auth: ObservableObject {

    static let shared: Auth = Auth()

    private let storage: KeychainStorage = KeychainWrapper.standard

    func logout() {
        storage.removeObject(for: .accessToken)
        storage.removeObject(for: .refreshToken)
    }

    func getCredentials() -> Credentials {
        return Credentials(
            accessToken: storage.string(for: .accessToken),
            refreshToken: storage.string(for: .refreshToken)
        )
    }

    func setCredentials(accessToken: String, refreshToken: String) {
        storage.set(accessToken, for: .accessToken)
        storage.set(refreshToken, for: .refreshToken)
    }

    func hasAccessToken() -> Bool {
        return getCredentials().accessToken != nil
    }

    func getAccessToken() -> String? {
        return getCredentials().accessToken
    }

    func getRefreshToken() -> String? {
        return getCredentials().refreshToken
    }

    func validate(accessToken: String) -> Bool {
        let currentTimestamp = Date().currentTimestamp
        let decodedJWT = JWT.decode(token: accessToken)

        guard let expirationTimestamp = decodedJWT["exp"] as? Int64 else {
            return false
        }

        return currentTimestamp < expirationTimestamp
    }

    func refreshTokens(refreshToken: String, completion: @escaping (String) -> Void) {
        RefreshTokenAction(parameters: RefreshTokenRequest(token: refreshToken)).call { response in

        self.setCredentials(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken
        )

        completion(response.accessToken)
      }
    }
}
