import SwiftUI

/// Responsible for managing and actual state of the current user role in the application.
final class UserRoleViewModel: ObservableObject {
    /// The current user role that defines the app flow.
    @Published var userRole: Role {
        didSet {
            PreferencesHandler.set(userRole: userRole)
        }
    }

    /// Initializes a new instance of the `UserRoleManager`.
    init() {
        userRole = PreferencesHandler.getUserRole()
    }

    /// Resets the current user role in the app to the default value.
    func resetCurrentRole() {
        userRole = .none
    }

    /// Sets the owner role in the application.
    func setOwnerRole() {
        userRole = .owner
    }

    /// Sets the sitter role in the application.
    func setSitterRole() {
        userRole = .sitter
    }
}
