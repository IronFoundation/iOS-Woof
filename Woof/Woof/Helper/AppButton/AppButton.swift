import Foundation

/// Represents name of buttons which uses in application.
enum AppButton: String, CustomStringConvertible {
    case cancel = "Cancel"
    case save = "Save"
    case edit = "Edit"
    case tryAgain = "Try Again"
    case logout = "Logout"
    case `continue` = "Continue"

    /// Text description of button
    var description: String {
        rawValue
    }
}
