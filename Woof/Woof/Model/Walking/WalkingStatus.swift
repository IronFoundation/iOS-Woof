import Foundation

/**
 The possible walking status values for a `Walking`.
 Conforms to the `Codable` protocol.
 */
enum WalkingStatus: Codable {
    /// The walking is available for booking.
    case available

    /// The walking is pending approval from the pet sitter.
    case pending

    /// The walking is booked by owner.
    case booked

    /// The walking has been completed.
    case finished

    /// The walking has been canceled by the sitter.
    case canceledBySitter

    /// The walking has expired due to the elapsed duration since it was initially declared.
    case expired

    /// Text description of possible status.
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
