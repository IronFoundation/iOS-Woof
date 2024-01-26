import XCTest

final class WalkingLocationTests: XCTestCase {
    func testInitialization() {
        // Given // When
        let longitude = 10.0
        let latitude = 20.0
        let address = "123 Main St"

        let location = Location(longitude: longitude, latitude: latitude, address: address)

        // Then
        XCTAssertEqual(location.longitude, longitude)
        XCTAssertEqual(location.latitude, latitude)
        XCTAssertEqual(location.address, address)
    }
}
