import Foundation

struct Walking: Codable, Identifiable {
    let id: UUID
    var owner: Owner?
    let sitter: Sitter
    let status: WalkingStatus
    let start: Date
    let end: Date
    var location: Location?
    let reviews: Reviews?
    let rating: Ratings?
    var notes: String?
    let price: Double
}

struct Location: Codable {
    var longitude: Double?
    var latitude: Double?
    var address: String?
}

struct Reviews: Codable {
    let ownerReview: String
    let sitterReview: String
}

struct Ratings: Codable {
    let ownerRating: Int
    let sitterRating: Int
}

enum WalkingStatus: Codable {
    case available
    case pending
    case booked
    case finished
//    case cancelledByOwner
    case canceledBySitter
    case expired

    var description: String {
        switch self {
        case .available:
            return "Available"
        case .pending:
            return "Pending"
        case .booked:
            return "Booked"
        case .finished:
            return "Done"
        case .canceledBySitter:
            return "Cancelled"
        case .expired:
            return "Expired"
        }
    }
}

extension Walking {
    enum Dummy {
        static let dummyWalking = Walking(
            id: UUID(),
            owner: Owner.Dummy.laraCroft,
            sitter: Sitter.Dummy.emilyDoe,
            status: .available,
            start: Date(),
            end: Date() + 2400,
            location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
            reviews: Reviews(ownerReview: "", sitterReview: ""),
            rating: Ratings(ownerRating: 0, sitterRating: 0),
            notes: "Sample notes",
            price: 28.0 // You can set the price as needed
        )

        static let bulkDummyWalkings = [
            Walking(
                id: UUID(),
                owner: nil,
                sitter: Sitter(), // You may want to create a Sitter instance here
                status: .finished, // You can change the status as needed
                start: Date() + 1200,
                end: Date() + 2800,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Reviews(ownerReview: "", sitterReview: ""),
                rating: Ratings(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 20.0 // You can set the price as needed
            ),
            Walking(
                id: UUID(),
                owner: Owner.Dummy.laraCroft,
                sitter: Sitter.Dummy.emilyDoe, // You may want to create a Sitter instance here
                status: .available, // You can change the status as needed
                start: Date(),
                end: Date() + 2400,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Reviews(ownerReview: "", sitterReview: ""),
                rating: Ratings(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 28.0 // You can set the price as needed
            ),
            Walking(
                id: UUID(),
                owner: Owner.Dummy.laraCroft,
                sitter: Sitter.Dummy.emilyDoe, // You may want to create a Sitter instance here
                status: .pending, // You can change the status as needed
                start: Date() + 5200,
                end: Date() + 6400,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Reviews(ownerReview: "", sitterReview: ""),
                rating: Ratings(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 18.0 // You can set the price as needed
            ),
            Walking(
                id: UUID(),
                owner: Owner.Dummy.laraCroft,
                sitter: Sitter.Dummy.emilyDoe, // You may want to create a Sitter instance here
                status: .available, // You can change the status as needed
                start: Date() + 12400,
                end: Date() + 14800,
                location: Location(longitude: 0.0, latitude: 0.0, address: "Sample Address"),
                reviews: Reviews(ownerReview: "", sitterReview: ""),
                rating: Ratings(ownerRating: 0, sitterRating: 0),
                notes: "Sample notes",
                price: 25.0 // You can set the price as needed
            ),
        ]
    }
}
