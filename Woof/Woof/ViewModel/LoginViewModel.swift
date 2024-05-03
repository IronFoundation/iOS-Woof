import Foundation

/// An interface is responsible for preparing and providing data for the `LoginView`.
final class LoginViewModel: ObservableObject {
    // MARK: - Internal interface

    /// Indicates whether to show owner onboarding flow.
    @Published var shouldShowOwnerOnboarding = false
    /// Indicates whether to show sitter onboarding flow.
    @Published var shouldShowSitterOnboarding = false

    /// Performs actions triggered by the owner role choice.
    func owneRoleDidSelected() {
        shouldShowOwnerOnboarding = !isCurrentOwnerExists
    }

    /// Performs actions triggered by the sitter role choice.
    func sitterRoleDidSelected() {
        shouldShowSitterOnboarding = !isCurrentSitterExists
    }

    // MARK: - Private interface

    private var isCurrentOwnerExists: Bool {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner) else {
            return false
        }
        guard (try? JSONDecoder().decode(Owner.self, from: data)) != nil else {
            return false
        }

        return true
    }

    private var isCurrentSitterExists: Bool {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else {
            return false
        }
        guard (try? JSONDecoder().decode(Sitter.self, from: data)) != nil else {
            return false
        }

        return true
    }
}
