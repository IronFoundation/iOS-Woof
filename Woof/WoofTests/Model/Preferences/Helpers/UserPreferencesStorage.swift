import Foundation

extension KeyValueStorage {
    /**
     Cleans the storage used for preferences.
     This method deletes the user preferences data from the key-value storage.

     Example usage:
     ```
     PreferencesHandlerTestHelper.cleanStorage()
     ```
     */
    static func removeAll() {
        let keyValueStorage = KeyValueStorage(KeyValueStorage.Name.preferences)
        keyValueStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }
}
