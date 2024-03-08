import Foundation

/// Responsible for preparing and processing data for the `BookingSlotView`.
final class BookingSlotViewModel: ObservableObject {
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

    @MainActor func bookWalking() async {}

    // MARK: - Private interface

    private var walking: Walking
}
