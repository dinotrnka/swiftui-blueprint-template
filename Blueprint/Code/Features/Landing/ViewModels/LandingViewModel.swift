import Foundation

class LandingViewModel {

    func refreshToken() {
        guard let refreshToken = Auth.shared.getRefreshToken() else {
            return
        }

        RefreshTokenAction(delegate: self, refreshToken: refreshToken).call { response in
            print("Refresh token response", response)
        }
    }

    func getMe() {
        GetMeAction(delegate: self).call { response in
            print("GET ME", response)
        }
    }
}

extension LandingViewModel: APIRequestDelegate {
    func onError(error: APIError) {
        print("API Error dude.", error.message)
    }
}
