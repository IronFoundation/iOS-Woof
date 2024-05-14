import Foundation

/// Possible time repeat intervals for recurring walkings.
enum WalkingRepeatInterval: String, CaseIterable {
    case never = "Never"
    case daily = "Daily"
    case weekly = "Weekly"
    case biweekly = "Every Two Weeks"
    case monthly = "Monthly"

    /// Returns the calendar component corresponding to the repeat interval.
    var dateComponent: Calendar.Component {
        switch self {
        case .daily:
            return .day
        case .weekly, .biweekly:
            return .weekOfYear
        case .monthly:
            return .month
        default:
            return .day
        }
    }

    /// Returns the value associated with the repeat interval.
    var value: Int {
        switch self {
        case .daily:
            return 1
        case .weekly:
            return 1
        case .biweekly:
            return 2
        case .monthly:
            return 1
        default:
            return 0
        }
    }
}
