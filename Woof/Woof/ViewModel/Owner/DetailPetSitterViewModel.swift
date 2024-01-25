import Foundation
import UIKit.UIPasteboard

/// The view model for a detailed sitter card, responsible for preparing and providing data for the view.
final class DetailSitterViewModel: ObservableObject {
    /// The full name of the sitter.
    @Published var fullName: String

    /// The additional information about the sitter.
    @Published var bio: String

    /// A 5-Star rating of the pet sitter.
    @Published var rating: StarRating

    /// The phone number of the sitter.
    @Published var phoneNumber: String

    /// The URL of the sitter's avatar image.
    @Published var imageURL: URL?

    /// The city or area where sitter works.
    @Published var city: String

    @Published var walkings: [Walking] = []

    /// Initializes a new instance of the detailed sitter card view model with the provided sitter.
    ///
    /// - Parameter sitter: The sitter for which the detailed view model is created.
    init(sitter: Sitter) {
        self.sitter = sitter
        fullName = DataTransformer.fullName(name: sitter.name, surname: sitter.surname)
        rating = DataTransformer.fiveStarRating(for: sitter.rating)
        phoneNumber = sitter.phone
        imageURL = sitter.avatarUrl
        bio = sitter.bio
        city = sitter.city
    }

    /// Copies the text to the clipboard. The copied text is available in the
    /// systemwide general clipboard, which you use for general copy-paste operations.
    ///
    /// - Parameter text: The text to be copied to the clipboard.
    func copyToClipboardText(_ text: String) {
        UIPasteboard.general.string = text
    }

    @MainActor func fetchWalkings() async {
        walkings = Walking.Dummy.bulkDummyWalkings
    }

    private var sitter: Sitter
}
