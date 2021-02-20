import Foundation

class MainViewModel: ObservableObject {

    func logout() {
        Auth.shared.logout()
    }
}
