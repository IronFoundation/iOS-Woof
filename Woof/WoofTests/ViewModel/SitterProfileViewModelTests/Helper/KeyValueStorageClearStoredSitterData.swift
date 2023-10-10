extension KeyValueStorage {
    /// Clears stored sitters data from storage.
    static func clearStoredSitterData() {
        KeyValueStorage(Self.Name.currentSitter).deleteData(for: Self.Key.currentSitter)
    }
}
