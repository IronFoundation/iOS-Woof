/**
 The review for the walking service.
 */
struct Review: Codable {
    /// The review given by the pet owner.
    let ownerReview: String

    /// The review given by the pet sitter.
    let sitterReview: String
}
