import Foundation

/**
 The owner and sitter reviews for the walking service.
 Conforms to the `Codable` protocol.
 */
struct Reviews: Codable {
    /// The review given by the pet owner.
    let ownerReview: String

    /// The review given by the pet sitter.
    let sitterReview: String
}
