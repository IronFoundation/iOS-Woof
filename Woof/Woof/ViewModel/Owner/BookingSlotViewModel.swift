import Foundation

/// Responsible for preparing and processing data for the `BookingSlotView`.
final class BookingSlotViewModel: ObservableObject {
    /// The notes about any details of the walking like meeting place, pet behavior, etc.
    @Published var notes: String = ""

    /// The full name of the sitter.
    let fullName: String

    /// A 5-Star rating of the pet sitter.
    let rating: StarRating

    /// The phone number of the sitter.
    let phoneNumber: String

    /// The city or area where sitter works.
    let city: String

    /// The price for walking.
    let price: Double

    /// The start date and time of walking.
    let startDate: Date

    /// The end date and time of walking.
    let endDate: Date

    /// Initializes a new instance of view model with the provided walking slot.
    ///
    /// - Parameter walking: The walking slot for which the view model is created.
    init(walking: Walking) {
        self.walking = walking

        fullName = DataTransformer.fullName(name: walking.sitter.name, surname: walking.sitter.surname)
        rating = DataTransformer.fiveStarRating(for: walking.sitter.rating)
        phoneNumber = walking.sitter.phone
        city = walking.sitter.city
        price = walking.price
        startDate = walking.start
        endDate = walking.end
    }

    /// Updates walking slot to reserve the it.
    @MainActor func bookWalking() async {}

    // MARK: - Private interface

    private var walking: Walking
}
