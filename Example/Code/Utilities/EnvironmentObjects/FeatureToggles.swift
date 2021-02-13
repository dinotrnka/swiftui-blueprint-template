//
//  FeatureToggles.swift
//  Example
//
//  Created by Dino Trnka on 13. 2. 2021..
//

import SwiftUI

enum FeatureToggle: String, CaseIterable {
    case redBackground = "Red Background"
    case goWild = "Go Wild"
    case bossMode = "Boss Mode"
}

class FeatureToggles: ObservableObject {

    static let shared = FeatureToggles()

    @Published var enabled: [FeatureToggle] = []

    var buttons: [ActionSheet.Button] {
        var buttons = FeatureToggle.allCases.map { featureToggle in
            Alert.Button.default(
                Text(FeatureToggles.shared.presentable(featureToggle: featureToggle))) {
                FeatureToggles.shared.toggle(featureToggle: featureToggle)
            }
        }

        buttons.append(Alert.Button.cancel())
        return buttons
    }

    func presentable(featureToggle: FeatureToggle) -> String {
        return "\(featureToggle.rawValue): \(isOn(featureToggle: featureToggle) ? "On" : "Off")"
    }

    func isOn(featureToggle: FeatureToggle) -> Bool {
        return enabled.contains(featureToggle)
    }

    func toggle(featureToggle: FeatureToggle) {
        if isOn(featureToggle: featureToggle) {
            setOff(featureToggle: featureToggle)
        } else {
            setOn(featureToggle: featureToggle)
        }
    }

    func setOn(featureToggle: FeatureToggle) {
        guard !isOn(featureToggle: featureToggle) else {
            return
        }
        enabled.append(featureToggle)
    }

    func setOff(featureToggle: FeatureToggle) {
        guard isOn(featureToggle: featureToggle) else {
            return
        }
        enabled.removeAll { $0 == featureToggle }
    }
}
