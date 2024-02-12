import Foundation

extension Walking {
    /// Provides dummy data for `Walking` model.
    enum Dummy {
        /// One instance of walking with the dummy data.
        static let dummyWalking = Walking(
            id: UUID(),
            owner: Owner.Dummy.laraCroft,
            sitter: Sitter.Dummy.emilyDoe,
            status: .available,
            start: Date(),
            end: Date() + 2400,
            location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
            reviews: Review(ownerReview: "", sitterReview: ""),
            rating: Rating(ownerRating: 0, sitterRating: 0),
            notes: "Sample notes",
            price: 28.0
        )

        /// The array of walking instances with the dummy data.
        static let bulkDummyWalkings = [
            Walking(
                id: UUID(),
                owner: nil,
                sitter: Sitter(),
                status: .finished,
                start: Date() + 1200,
                end: Date() + 2800,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Review(ownerReview: "", sitterReview: ""),
                rating: Rating(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 20.0
            ),
            Walking(
                id: UUID(),
                owner: Owner.Dummy.laraCroft,
                sitter: Sitter.Dummy.emilyDoe,
                status: .available,
                start: Date(),
                end: Date() + 2400,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Review(ownerReview: "", sitterReview: ""),
                rating: Rating(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 28.0
            ),
            Walking(
                id: UUID(),
                owner: Owner.Dummy.laraCroft,
                sitter: Sitter.Dummy.emilyDoe,
                status: .pending,
                start: Date() + 5200,
                end: Date() + 6400,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Review(ownerReview: "", sitterReview: ""),
                rating: Rating(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 18.0
            ),
            Walking(
                id: UUID(),
                owner: Owner.Dummy.laraCroft,
                sitter: Sitter.Dummy.emilyDoe,
                status: .available,
                start: Date() + 12400,
                end: Date() + 14800,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Review(ownerReview: "", sitterReview: ""),
                rating: Rating(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 25.0
            ),
        ]
    }
}
