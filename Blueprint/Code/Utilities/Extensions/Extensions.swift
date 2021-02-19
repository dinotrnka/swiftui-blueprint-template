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

