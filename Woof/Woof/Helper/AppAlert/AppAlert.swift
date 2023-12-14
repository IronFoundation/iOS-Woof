/// Represents the alerts that are used in the application.
enum AppAlert: String, CaseIterable {
    /// Alert shown as confirmation of log out
    case logOut = "Do you really want to log out?"

    /// Alert shown as a result of an error
    case error = "Error"
}
