import Foundation

/// The view model for a owner profile view that is responsible for preparing and providing data for it.
final class OwnerProfileViewModel: ObservableObject {
    /// The name of owner
    @Published var name: String = ""

    /// The surname of owner
    @Published var surname: String = ""

    /// The phone number of owner
    @Published var phone: String = ""

    /// The owner's city
    @Published var city: String = ""

    /// The address of owner street and building
    @Published var address: String = ""

    /// The URL of the owner's avatar image.
    @Published var avatarURL: URL?

    /// Indicates whether the alert should be shown.
    @Published var isAlertShown = false

    /// Indicates whether the logout confirmation was obtained.
    @Published var isLogoutConfirmed = false

    /**
     Initializes an instance of the `OwnerProfileViewModel` class.
     */
    init() {
        currentOwner = getCurrentOwner()

        name = currentOwner.name
        surname = currentOwner.surname
        phone = currentOwner.phone
        city = currentOwner.city
        address = currentOwner.address
        avatarURL = currentOwner.avatarURL
    }

    /// Requests model layer to save modified data.
    func save() {
        currentOwner.name = name
        currentOwner.surname = surname
        currentOwner.phone = phone
        currentOwner.city = city
        currentOwner.address = address
        currentOwner.avatarURL = avatarURL

        guard let data = try? JSONEncoder().encode(currentOwner) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .save(data, for: KeyValueStorage.Key.currentOwner)
    }

    /**
     Returns the owner information that will be displayed in view.

        - Returns: The owner instance from model layer or new instance of `Owner`,
     if loading from model layer is failed.
     */
    func getCurrentOwner() -> Owner {
        loadOwnerFromStorage() ?? Owner()
    }

    // MARK: - Private interface

    private lazy var currentOwner: Owner = getCurrentOwner()

    private func loadOwnerFromStorage() -> Owner? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner) else {
            return nil
        }
        guard let owner = try? JSONDecoder().decode(Owner.self, from: data) else {
            return nil
        }

        return owner
    }
}
