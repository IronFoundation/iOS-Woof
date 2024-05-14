import XCTest

final class WalkingRepeatIntervalTests: XCTestCase {
    func testDateComponentReturnsExpectedDate() {
        // Given // When // Then
        XCTAssertEqual(WalkingRepeatInterval.never.dateComponent, .day)
        XCTAssertEqual(WalkingRepeatInterval.daily.dateComponent, .day)
        XCTAssertEqual(WalkingRepeatInterval.weekly.dateComponent, .weekOfYear)
        XCTAssertEqual(WalkingRepeatInterval.biweekly.dateComponent, .weekOfYear)
        XCTAssertEqual(WalkingRepeatInterval.monthly.dateComponent, .month)
    }

    func testValueReturnsExpectedNumbers() {
        // Given // When // Then
        XCTAssertEqual(WalkingRepeatInterval.never.value, 0)
        XCTAssertEqual(WalkingRepeatInterval.daily.value, 1)
        XCTAssertEqual(WalkingRepeatInterval.weekly.value, 1)
        XCTAssertEqual(WalkingRepeatInterval.biweekly.value, 2)
        XCTAssertEqual(WalkingRepeatInterval.monthly.value, 1)
    }

    func testStringRepresentationReturnsExpectedStringAndExist() {
        // Given // When // Then
        XCTAssertEqual(WalkingRepeatInterval.never.rawValue, "Never")
        XCTAssertEqual(WalkingRepeatInterval.daily.rawValue, "Daily")
        XCTAssertEqual(WalkingRepeatInterval.weekly.rawValue, "Weekly")
        XCTAssertEqual(WalkingRepeatInterval.biweekly.rawValue, "Every Two Weeks")
        XCTAssertEqual(WalkingRepeatInterval.monthly.rawValue, "Monthly")
    }
}
