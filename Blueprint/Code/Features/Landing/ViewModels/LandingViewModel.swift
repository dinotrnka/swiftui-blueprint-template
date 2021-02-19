import Foundation

class LandingViewModel {
    func sendAPICall() {
        guard let refreshToken = Auth.shared.getRefreshToken() else {
            return
        }

        RefreshTokenAction(delegate: self, refreshToken: refreshToken).call { response in
            print("Huh?", response)
        }
    }
}

extension LandingViewModel: APIRequestDelegate {
    func onError(message: String) {
        print("API Error dude.", message)
    }
}
