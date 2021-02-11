//
//  LandingView.swift
//  Example
//
//  Created by Dino Trnka on 29. 1. 2021..
//

import SwiftUI

struct LandingView: View {
  var body: some View {
    VStack {
      Rectangle()
        .fill(CustomColor.background)
        .frame(width: 200, height: 100)

      Spacer()

      Rectangle()
        .fill(CustomColor.primary)
        .frame(width: 200, height: 100)

      Spacer()

      Rectangle()
        .fill(CustomColor.text)
        .frame(width: 200, height: 100)

      Spacer()

      Rectangle()
        .fill(CustomColor.secondary)
        .frame(width: 200, height: 100)

      Spacer()
  
      Text("Hello there friend!")
    }
  }
}

struct LandingView_Previews: PreviewProvider {
  static var previews: some View {
    LandingView()
  }
}
