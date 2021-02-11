//
//  LandingView.swift
//  Example
//
//  Created by Dino Trnka on 29. 1. 2021..
//

import SwiftUI

struct LandingView: View {
  var body: some View {
    ScrollView {
      VStack {
        Spacer()

        Rectangle()
          .fill(LinearGradient(
            gradient: CustomColor.gradient,
            startPoint: .bottom,
            endPoint: .top
          ))
          .frame(width: 200, height: 100)

        Spacer()

        Rectangle()
          .fill(CustomColor.background)
          .frame(width: 200, height: 100)

        Spacer()

        Rectangle()
          .fill(CustomColor.text)
          .frame(width: 200, height: 100)

        Spacer()

        Rectangle()
          .fill(CustomColor.primary)
          .frame(width: 200, height: 100)

        Spacer()

        Rectangle()
          .fill(CustomColor.secondary)
          .frame(width: 200, height: 100)
      }
    }
  }
}

struct LandingView_Previews: PreviewProvider {
  static var previews: some View {
    LandingView()
  }
}
