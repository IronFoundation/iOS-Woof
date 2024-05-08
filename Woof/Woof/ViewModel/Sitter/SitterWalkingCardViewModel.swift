import Foundation

/// Responsible for preparing and providing data for it  walking card view for sitter flow.
final class SitterWalkingCardViewModel {
    /// The full name of the owner.
    var fullName: String {
        DataTransformer.fullName(
            name: walking.owner?.name ?? "",
            surname: walking.owner?.surname ?? ""
        )
    }

    /// The city of walking.
    var city: String {
        walking.owner?.city ?? ""
    }

    /// The detailed address of walking.
    var address: String {
        walking.owner?.address ?? ""
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

    // Initializes a new instance of view model with the provided walking information.
    ///
    /// - Parameter walking: The walking to be prepared to present.
    init(walking: Walking) {
        self.walking = walking
    }

    // MARK: - Private interface

    private let walking: Walking
}
