import Foundation

final class OwnerOnboardingViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var phone: String = ""

    func saveOwnerData() {
        guard let data = try? JSONEncoder().encode(owner) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .save(data, for: KeyValueStorage.Key.currentOwner)
    }

    // MARK: - Private interface

    private var owner: Owner {
        Owner(
            name: name.isEmpty ? "" : name,
            surname: "",
            phone: phone.isEmpty ? "" : phone,
            avatarURL: nil,
            address: "",
            rating: 0.0
        )
    }
}
