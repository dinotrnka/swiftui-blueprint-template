import Foundation

enum LaunchArgument: String {
  case isMocked
}

class LaunchArguments {

  static let shared = LaunchArguments()

  var isMocked: Bool {
    isEnabled(.isMocked)
  }

  private func isEnabled(_ argument: LaunchArgument) -> Bool {
    ProcessInfo.processInfo.arguments.contains(argument.rawValue)
  }

}
