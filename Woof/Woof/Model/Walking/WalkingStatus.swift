import Foundation

enum WalkingStatus: Codable {
    case available
    case pending
    case booked
    case finished
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
