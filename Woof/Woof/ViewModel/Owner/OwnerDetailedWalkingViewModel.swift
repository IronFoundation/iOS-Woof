import Foundation

final class OwnerDetailedWalkingViewModel: ObservableObject {
    /// The full name of the sitter.
    var fullName: String {
        DataTransformer.fullName(
            name: walking.sitter.name,
            surname: walking.sitter.surname
        )
    }

    /// A 5-Star rating of the pet sitter.
    var rating: StarRating {
        DataTransformer.fiveStarRating(for: walking.sitter.rating)
    }

    /// The phone number of the sitter.
    var phoneNumber: String {
        walking.sitter.phone
    }

    /// The URL of the sitter's avatar image.
    var imageURL: URL? {
        walking.sitter.avatarUrl
    }

    /// The detailed address of walking.
    var address: String {
        guard let city = walking.owner?.city, let address = walking.owner?.address else {
            return "missing address"
        }
        return "\(city), \(address)"
    }

    /// The price of walking.
    var price: Double {
        walking.price
    }

    /// The time interval of walking
    var time: String {
        let start = walking.start.formatted(date: .omitted, time: .shortened)
        let end = walking.end.formatted(date: .omitted, time: .shortened)

        return "\(start) - \(end)"
    }

    /// The date of walking
    var date: String {
        walking.start.formatted(date: .abbreviated, time: .omitted)
    }

    /// The current status of walking.
    var status: WalkingStatus {
        walking.status
    }

    /// The notes made by the owner.
    var notes: String {
        walking.notes ?? "The information was not provided."
    }

    init(walking: Walking) {
        self.walking = walking
    }

    // MARK: - Private interface

    private var walking: Walking
}
