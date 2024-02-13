import Foundation
import NetworkService

final class SitterOnboardingViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var phone: String = ""

    func saveSitterDataLocally() {
        guard let data = try? JSONEncoder().encode(sitter) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .save(data, for: KeyValueStorage.Key.currentSitter)
    }

    // TODO: Implement upload method

    // MARK: - Private interface

    private var sitter: Sitter {
        Sitter(
            name: name.isEmpty ? "" : name,
            surname: "",
            phone: phone.isEmpty ? "" : phone,
            avatarUrl: nil,
            bio: "",
            rating: 0.0, pricePerHour: 0.0,
            city: ""
        )
    }
}
