import Foundation

class LandingViewModel {
    func sendAPICall() {
        guard let refreshToken = Auth.shared.getRefreshToken() else {
            return
        }

        RefreshTokenAction(delegate: self, refreshToken: refreshToken).call { response in
            print("Refresh token response")
        }
    }
}

extension LandingViewModel: APIRequestDelegate {
    func onError(message: String) {
        print("API Error dude.", message)
    }
}
