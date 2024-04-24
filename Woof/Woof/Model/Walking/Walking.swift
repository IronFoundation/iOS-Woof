import Foundation

// Conformation to `Equatable` protocol allows to redraw the walking views only when they changed.
// Reference info from article https://www.donnywals.com/understanding-how-and-when-swiftui-decides-to-redraw-views/
/**
 Pet walking service provided by a pet sitter for pet owners.
 */
struct Walking: Codable, Identifiable, Equatable {
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

    /// The rating is given to owner by the pet sitter.
    let ownerRating: Int?

    /// The rating is given to sitter by the pet owner.
    let sitterRating: Int?

    /// The review is given by the pet owner.
    let ownerReview: String?

    /// The review is given by the pet sitter.
    let sitterReview: String?

    /// The owner additional notes to the sitter about any details of the walking service.
    var notes: String?

    /// The price for the walking service.
    var price: Double
}
