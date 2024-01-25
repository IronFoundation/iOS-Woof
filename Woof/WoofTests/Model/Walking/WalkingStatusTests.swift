import XCTest

final class WalkingStatusTests: XCTestCase {
    func testDescriptionReturnsExpectedStringAndExist() {
        // Given // When // Then
        XCTAssertEqual(WalkingStatus.available.description, "Available")
        XCTAssertEqual(WalkingStatus.pending.description, "Pending")
        XCTAssertEqual(WalkingStatus.booked.description, "Booked")
        XCTAssertEqual(WalkingStatus.finished.description, "Done")
        XCTAssertEqual(WalkingStatus.canceledBySitter.description, "Cancelled")
        XCTAssertEqual(WalkingStatus.expired.description, "Expired")
    }
}
