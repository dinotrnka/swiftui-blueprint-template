import SwiftUI

struct MainView: View {

    @ObservedObject var viewModel: MainViewModel = MainViewModel()

    var body: some View {
        VStack {

            Spacer()

            Button {
                viewModel.logout()
            } label: {
                Text("Main.LogoutButtonTitle".localized)
                    .modifier(MainButton(color: CustomColor.danger))
            }

            Spacer()

        }
        .padding(30)
        .modifier(Screen())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
