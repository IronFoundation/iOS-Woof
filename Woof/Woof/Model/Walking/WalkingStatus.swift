/**
 The possible walking status values for a `Walking`.
 */
enum WalkingStatus: String, Codable {
    /// The walking is available for booking.
    case available = "Available"

    /// The walking is pending approval from the pet sitter.
    case pending = "Pending"

    /// The walking has been booked by owner.
    case booked = "Booked"

    /// The walking has been completed.
    case finished = "Done"

    /// The walking has been canceled by the sitter.
    case canceledBySitter = "Cancelled"

    /// The walking has expired due to the elapsed duration since it was initially declared.
    case expired = "Expired"
}
