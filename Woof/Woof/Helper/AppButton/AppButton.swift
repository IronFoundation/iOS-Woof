import Foundation

/// Represents name of buttons which uses in application.
enum AppButton: String, CustomStringConvertible, CaseIterable {
    /// Represents the "Cancel" button.
    case cancel = "Cancel"

    /// Represents the "Save" button.
    case save = "Save"

    /// Represents the "Edit" button.
    case edit = "Edit"

    /// Represents the "Try Again" button.
    case tryAgain = "Try Again"

    /// Represents the "Logout" button.
    case logout = "Logout"

    /// Represents the "Continue" button.
    case `continue` = "Continue"

    /// Text description of button
    var description: String {
        rawValue
    }
}
