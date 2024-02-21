import Foundation

/// Represents user preferences.
struct Preferences: Codable {
    /// The selected role for the user, by default is `none`
    var selectedRole: Role = .none

    /// Indicates it's needed to show the onboarding screen for the owner. Default is `true`.
    var showOwnerOnboarding: Bool = true

    /// Indicates it's needed to show the onboarding screen for the sitter. Default is `true`.
    var showSitterOnboarding: Bool = true
}
