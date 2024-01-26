import XCTest

final class WalkingStatusTests: XCTestCase {
    func testDescriptionReturnsExpectedStringAndExist() {
        // Given // When // Then
        XCTAssertEqual(WalkingStatus.available.rawValue, "Available")
        XCTAssertEqual(WalkingStatus.pending.rawValue, "Pending")
        XCTAssertEqual(WalkingStatus.booked.rawValue, "Booked")
        XCTAssertEqual(WalkingStatus.finished.rawValue, "Done")
        XCTAssertEqual(WalkingStatus.canceledBySitter.rawValue, "Cancelled")
        XCTAssertEqual(WalkingStatus.expired.rawValue, "Expired")
    }
}
