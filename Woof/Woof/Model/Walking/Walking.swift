import Foundation

/**
 Pet walking service provided by a pet sitter for pet owners.
 Conforms to the `Codable` and `Identifiable` protocols.
 */
struct Walking: Codable, Identifiable {
    /// The unique identifier for the walking instance.
    let id: UUID

    /// The owner of the pet being walked.
    var owner: Owner?

    /// The pet sitter responsible for the walking service.
    let sitter: Sitter

    /// The current status of the walking service.
    let status: WalkingStatus

    /// The start time of the walking service.
    let start: Date

    /// The end time of the walking service.
    let end: Date

    /// The geographical location of the walking service.
    var location: Location?

    /// The owner and sitter reviews for the walking service.
    let reviews: Reviews?

    /// The ratings given by both the pet owner and the pet sitter
    let rating: Ratings?

    /// The owner additional notes to the sitter about any details of the walking service.
    var notes: String?

    /// The price for the walking service.
    let price: Double
}
