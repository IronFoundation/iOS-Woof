import Foundation

/// Represents user preferences.
struct Preferences: Codable {
    /// The selected role for the user, by default is `none`
    var selectedRole: Role = .none

    /// Indicates whether it's necessary to display the onboarding screen for the owner. The default value is `true`.
    var showOwnerOnboarding: Bool = true

    /// Indicates whether it's necessary to display the onboarding screen for the sitter. The default value is `true`.
    var showSitterOnboarding: Bool = true
}
