import Foundation

/// The view model for a owner profile view that is responsible for preparing and providing data for it.
class OwnerProfileViewModel: ObservableObject {
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

    /// Detailed error information for the user.
    @Published var errorMessage: String?

    /// Indicates if the mandatory fields are empty.
    var mandatoryFieldsAreEmpty: Bool {
        name.isEmpty || phone.isEmpty || city.isEmpty || address.isEmpty
    }

    /**
     Initializes an instance of the `OwnerProfileViewModel` class.
     */
    init() {
        setUpFields()
    }

    /// Requests model layer to save modified data.
    func save() {
        var newOwner = currentOwner ?? .init()
        newOwner.name = name
        newOwner.surname = surname
        newOwner.phone = phone
        newOwner.city = city
        newOwner.address = address
        newOwner.avatarURL = avatarURL

        if let data = try? JSONEncoder().encode(newOwner),
           KeyValueStorage(KeyValueStorage.Name.currentOwner)
           .save(data, for: KeyValueStorage.Key.currentOwner) {
        } else {
            errorMessage = AppError.saveLocallyFailed.errorDescription
        }
    }

    /**
     Returns the owner information that will be displayed in view.

     - Returns: The owner instance from model layer; `nil` if there is no saved owner.
     */
    func getCurrentOwner() -> Owner? {
        loadOwnerFromStorage()
    }

    // MARK: - Private interface

    private lazy var currentOwner: Owner? = getCurrentOwner()

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

    private func setUpFields() {
        name = currentOwner?.name ?? ""
        surname = currentOwner?.surname ?? ""
        phone = currentOwner?.phone ?? ""
        city = currentOwner?.city ?? ""
        address = currentOwner?.address ?? ""
        avatarURL = currentOwner?.avatarURL
    }
}
