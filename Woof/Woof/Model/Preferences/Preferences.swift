import Foundation

/// Represents user preferences.
struct Preferences: Codable {
    /// The selected role for the user, by default is `none`
    var selectedRole: Role = .none

    /// Indicates whether it's necessary to display the onboarding screen for the user. The default value is `true`.
    var shouldShowOnboarding: Bool {
        get {
            shouldShowOnboardingForRole[selectedRole] ?? true
        }
        set {
            shouldShowOnboardingForRole[selectedRole] = newValue
        }
    }

    private var shouldShowOnboardingForRole = [Role.owner: true, .sitter: true]
}
