//
//  LandingView.swift
//  Example
//
//  Created by Dino Trnka on 29. 1. 2021..
//

import SwiftUI

struct LandingView: View {

    @State var navigationActive: Bool = false

    var body: some View {
        ScrollView {

            NavigationLink(
              destination: LandingTwoView(),
              isActive: $navigationActive,
              label: {
                Text("Dino Trnka")
              })

            Spacer()

            VStack {
                Text(Configuration.get(.environment))
                Text(Configuration.get(.baseUrl))
                Text(Configuration.shared.segmentWriteKey)
            }

            Spacer()

            VStack {
                Group {
                    Text("ErrorMessage.Default".localized)
                        .font(CustomFont.secretWinter(size: 20))

                    Spacer()

                    Text("ErrorMessage.NoInternet".localized)
                        .font(CustomFont.oldLondon(size: 20))

                    Spacer()

                    Text("Hello there friend!")
                        .font(CustomFont.wrestlemania(size: 20))
                }
            }

            Spacer()

            Group {
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
