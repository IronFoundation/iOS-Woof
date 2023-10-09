extension KeyValueStorage {
    /// Clears stored sitters data from storage.
    static func clearStoredSitterData() {
        let keyValueStorage = KeyValueStorage(KeyValueStorage.Name.currentSitter)
        keyValueStorage.deleteData(for: KeyValueStorage.Key.currentSitter)
    }
}
