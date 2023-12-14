import Foundation

/// Represents alerts which uses in application.
enum AppAlert: String, CustomStringConvertible, CaseIterable {
    /// Alert shown as confirmation of log out
    case logOut = "Do you really want to log out?"

    /// Alert shown as a result of an error
    case error = "Error"

    /// Text description of alert
    var description: String {
        rawValue
    }
}
