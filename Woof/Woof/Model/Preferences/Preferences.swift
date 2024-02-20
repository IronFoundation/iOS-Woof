import Foundation

/// Represents user preferences.
struct Preferences: Codable {
    /// The selected role for the user, by default is `none`
    var selectedRole: Role = .none
    
    /// Indicates whether the owner has logged in at least once. Default is `false`.
    var isOwnerLoggedOnce: Bool = false

    /// Indicates whether the sitter has logged in at least once. Default is `false`.
    var isSitterLoggedOnce: Bool = false
}
