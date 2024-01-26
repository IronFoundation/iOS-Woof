/**
 The ratings given by both the pet owner and the pet sitter
 */
struct Rating: Codable {
    /// The rating is given to walking by the pet owner.
    let ownerRating: Double

    /// The rating is given to walking by the pet sitter.
    let sitterRating: Double
}
