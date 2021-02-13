//
//  Fonts.swift
//  Example
//
//  Created by Dino Trnka on 11. 2. 2021..
//

import SwiftUI

struct CustomFont {
    static func wrestlemania(size: CGFloat) -> Font {
        Font.custom("WRESTLEMANIA", size: size)
    }

    static func secretWinter(size: CGFloat) -> Font {
        Font.custom("Secret Winter", size: size)
    }

    static func oldLondon(size: CGFloat) -> Font {
        Font.custom("OldLondon", size: size)
    }
}
