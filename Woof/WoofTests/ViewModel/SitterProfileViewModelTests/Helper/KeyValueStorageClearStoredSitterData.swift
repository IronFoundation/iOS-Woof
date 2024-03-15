extension KeyValueStorage {
    /// Clears stored sitters data from storage.
    static func clearStoredSitterData() {
        KeyValueStorage(Name.currentSitter).deleteData(for: Key.currentSitter)
    }
}
