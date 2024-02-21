import XCTest

final class WalkingStatusTests: XCTestCase {
    func testDescriptionReturnsExpectedStringAndExist() {
        // Given // When // Then
        XCTAssertEqual(WalkingStatus.available.rawValue, "Available")
        XCTAssertEqual(WalkingStatus.pending.rawValue, "Pending")
        XCTAssertEqual(WalkingStatus.booked.rawValue, "Booked")
        XCTAssertEqual(WalkingStatus.finished.rawValue, "Done")
    }

    func testWalkingStatusCasesExistInApi() {
        // Given // When
        let expectedCases: [WalkingStatus] = [
            .available,
            .pending,
            .booked,
            .finished,
        ]

        // Then
        XCTAssertEqual(Set(expectedCases), Set(WalkingStatus.allCases))
    }
}
