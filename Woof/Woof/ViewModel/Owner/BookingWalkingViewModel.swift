import Foundation
import UIKit.UIPasteboard

final class BookingWalkingViewModel: ObservableObject {
    @Published var address = ""
    @Published var notes = ""

    let fullName: String
    let rating: StarRating
    let phoneNumber: String
    let imageURL: URL?
    let city: String
    let price: Double
    let start: Date
    let end: Date

    init(walking: Walking) {
        self.walking = walking
        fullName = DataTransformer.fullName(
            name: walking.sitter.name,
            surname: walking.sitter.surname
        )
        rating = DataTransformer.fiveStarRating(for: walking.sitter.rating)
        phoneNumber = walking.sitter.phone
        imageURL = walking.sitter.avatarUrl
        city = walking.sitter.city
        price = walking.price
        start = walking.start
        end = walking.end
    }

    /// Copies the text to the clipboard. The copied text is available in the
    /// systemwide general clipboard, which you use for general copy-paste operations.
    ///
    /// - Parameter text: The text to be copied to the clipboard.
    func copyToClipboardText(_ text: String) {
        UIPasteboard.general.string = text
    }

    func setOwnerInfo() {
        let owner = loadOwnerFromStorage() ?? Owner()
        address = owner.address
        walking.owner = owner
    }

    // MARK: - Private interface

    private lazy var currentOwner: Owner = loadOwnerFromStorage() ?? Owner()

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

    private var walking: Walking
}
