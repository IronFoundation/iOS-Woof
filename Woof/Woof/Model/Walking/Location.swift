import Foundation

/**
 The geographical location of the walking service.
 Conforms to the `Codable` protocols.
 */
struct Location: Codable {
    /// The longitude coordinate of the location of the walking.
    var longitude: Double?
    
    /// The latitude coordinate of the location of the walking.
    var latitude: Double?
    
    /// The address of the location of the walking.
    var address: String?
}
