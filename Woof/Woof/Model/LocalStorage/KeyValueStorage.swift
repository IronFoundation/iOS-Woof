import Foundation

/// A persistent storage designed for managing a collection of raw data (a byte buffer in memory).
/// This data is stored and retrieved using a key that uniquely identifies itself.
/// The key is used to find the data within the storage.
class KeyValueStorage {
    /// Instance of persistent storage with the specified database name.
    private let storage = UserDefaults(suiteName: "com.foundation-iron.iOS.Woof")
    /**
      Saves the data associated with the specified key.

      - Parameters:
         - data: The data to save as a byte buffer in memory.
         - key: The key under which the value will be stored.
     */
    @discardableResult func save(data: Data, for key: String) -> Bool {
        storage?.set(data, forKey: key)
        return storage?.object(forKey: key) as? Data != nil ? true : false
    }

    /**
      Retrieves the data associated with the given key.

      - Parameters:
         - key: The key associated with the data in storage.

      - Returns: The data as a byte buffer in memory associated with the given key, otherwise returns `nil`.
     */
    func loadValue(for key: String) -> Data? {
        storage?.data(forKey: key)
    }

    /**
      Removes the given key and its associated data.
     If the key isn’t found, method does nothing.

       - Parameters:
          - key: The key to remove along with its associated data.
      */
    func deleteValue(for key: String) {
        storage?.removeObject(forKey: key)
    }
}
