class Mock {

    static let shared = Mock()

    var isEnabled: Bool = LaunchArguments.shared.isMocked

}
