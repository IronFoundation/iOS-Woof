import Foundation

/// The view model for a sitter card, responsible for preparing and providing data for the view.
final class SitterCardViewModel: ObservableObject {
    /// The full name of the sitter.
    @Published var fullName: String

    /// The additional information about the sitter.
    @Published var bio: String

    /// A 5-Star rating of the pet sitter.
    @Published var rating: StarRating

    /// The price per hour charged by the sitter.
    @Published var price: Double

    /// The URL of the sitter's avatar image.
    @Published var imageURL: URL?

    /// Initializes a new instance of the sitter card view model with the provided sitter.
    ///
    /// - Parameter sitter: The sitter for which the view model is created.
    init(sitter: Sitter) {
        self.sitter = sitter
        fullName = DataTransformer.fullName(name: sitter.name, surname: sitter.surname)
        rating = DataTransformer.fiveStarRating(for: sitter.rating ?? 0)
        price = sitter.pricePerHour ?? 0
        imageURL = sitter.avatarUrl
        bio = sitter.bio
    }

    private var sitter: Sitter
}
