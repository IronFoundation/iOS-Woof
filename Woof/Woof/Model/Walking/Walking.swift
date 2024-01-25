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
