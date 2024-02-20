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
     Saves the information whether the owner has logged in at least once.

     - Parameters:
        - isOwnerLoggedOnce: A boolean value indicating whether the owner has logged in at least once.

     - Returns: A boolean value indicating whether the saving operation was successful.
     */
    @discardableResult static func setOwnerLoggedOnce(_ isOwnerLoggedOnce: Bool) -> Bool {
        var preferences = loadPreferences() ?? Preferences()

        preferences.isOwnerLoggedOnce = isOwnerLoggedOnce

        return store(preferences)
    }

    /**
     Saves the information whether the sitter has logged in at least once.

     - Parameters:
        - isSitterLoggedOnce: A boolean value indicating whether the sitter has logged in at least once.

     - Returns: A boolean value indicating whether the saving operation was successful.
     */
    @discardableResult static func setSitterLoggedOnce(_ isSitterLoggedOnce: Bool) -> Bool {
        var preferences = loadPreferences() ?? Preferences()

        preferences.isSitterLoggedOnce = isSitterLoggedOnce

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
     Gets the information whether the owner has logged in at least once.

     - Returns: A boolean value indicating whether the owner has logged in at least once.
     */
    static func getOwnerLoggedOnce() -> Bool {
        loadPreferences()?.isOwnerLoggedOnce ?? false
    }

    /**
     Gets the information whether the sitter has logged in at least once.

     - Returns: A boolean value indicating whether the sitter has logged in at least once.
     */
    static func getSitterLoggedOnce() -> Bool {
        loadPreferences()?.isSitterLoggedOnce ?? false
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
