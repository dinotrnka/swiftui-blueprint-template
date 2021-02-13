//
//  StringExtension.swift
//  Example
//
//  Created by Dino Trnka on 11. 2. 2021..
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }

    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
