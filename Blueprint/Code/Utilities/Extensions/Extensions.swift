import SwiftUI
import Combine

let shakePublisher = PassthroughSubject<Void, Never>()

extension UIView {
    open override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard Configuration.shared.featureTogglesEnabled && motion == .motionShake else {
            return
        }

        shakePublisher.send()
    }
}

extension Date {
    var currentTimestamp: Int64 {
        return Int64(self.timeIntervalSince1970)
    }
}

extension URLRequest {
    mutating func addDefaultHeaders() {
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
    }

    mutating func addAuthorizationHeader(accessToken: String) {
        self.addValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
    }
}
