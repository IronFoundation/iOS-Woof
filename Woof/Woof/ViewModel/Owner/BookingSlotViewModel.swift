import Foundation

/// Responsible for preparing and processing data for the `BookingSlotView`.
final class BookingSlotViewModel: ObservableObject {
    /// The notes about any details of the walking like meeting place, pet behavior, etc.
    @Published var notes: String = ""

    /// The full name of the sitter.
    var fullName: String {
        DataTransformer.fullName(name: walking.sitter.name, surname: walking.sitter.surname)
    }

    /// A 5-Star rating of the pet sitter.
    var rating: StarRating {
        DataTransformer.fiveStarRating(for: walking.sitter.rating)
    }

    /// The phone number of the sitter.
    var phoneNumber: String {
        walking.sitter.phone
    }

    /// The city or area where sitter works.
    var city: String {
        walking.sitter.city
    }

    /// The price for walking.
    var price: Double {
        walking.price
    }

    /// The start date and time of walking.
    var startDate: Date {
        walking.start
    }

    /// The end date and time of walking.
    var endDate: Date {
        walking.end
    }

    /// Initializes a new instance of view model with the provided walking slot.
    ///
    /// - Parameter walking: The walking slot for which the view model is created.
    init(walking: Walking) {
        self.walking = walking
    }

    /// Updates walking slot to reserve the it.
    @MainActor func bookWalking() async {}

    // MARK: - Private interface

    private var walking: Walking
}
