import Foundation

/**
 A type that manages saving to and retrieving user preferences from
 the local storage.
 */
enum PreferencesHandler {
    // MARK: - Internal interface

    /**
     Saves the current role in the app.

     - Parameters:
        - userRole: The current role to be saved.

     - Returns: A boolean value indicating whether the saving operation was successful.
     */
    @discardableResult static func set(userRole: Role) -> Bool {
        var preferences = loadPreferences() ?? Preferences()

        preferences.selectedRole = userRole

        return store(preferences)
    }

    /**
     Sets a flag indicating whether the onboarding screen for the owner needs to be displayed.

     - Parameters:
        - shouldShowOnboarding: A boolean value indicates whether it's need to demonstrate onboarding.

     - Returns: A boolean value indicating whether the saving operation was successful.
     */
    @discardableResult static func setShouldShowOnboarding(_ shouldShowOnboarding: Bool) -> Bool {
        var preferences = loadPreferences() ?? Preferences()
        preferences.shouldShowOnboarding = shouldShowOnboarding
        return store(preferences)
    }

    /**
     Gets the current user role in the app.

     - Returns: The current role for the user in the app session. If no role is selected, returns `.none`.
     */
    static func getUserRole() -> Role {
        loadPreferences()?.selectedRole ?? .none
    }

    /**
     Gets the current state of the onboarding screen display flag.

     - Returns: A boolean value reflecting the state of the flag.
     */
    static func getShowOnboarding() -> Bool {
        guard let preferences = loadPreferences() else { return true }
        return preferences.shouldShowOnboarding
    }

    // MARK: - Private interface

    private static func loadPreferences() -> Preferences? {
        guard let data = preferencesStorage.loadData(for: preferencesKey) else {
            return nil
        }

        return try? JSONDecoder().decode(Preferences.self, from: data)
    }

    private static func store(_ preferences: Preferences) -> Bool {
        guard let data = try? JSONEncoder().encode(preferences) else {
            return false
        }

        return preferencesStorage.save(data, for: preferencesKey)
    }

    private static var preferencesStorage: KeyValueStorage {
        KeyValueStorage(KeyValueStorage.Name.preferences)
    }

    private static var preferencesKey: String {
        KeyValueStorage.Key.userPreferences
    }
}
