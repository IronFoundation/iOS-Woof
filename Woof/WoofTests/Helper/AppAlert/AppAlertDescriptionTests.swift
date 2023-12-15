import XCTest

final class AppAlertDescriptionTests: XCTestCase {
    func testAppAlertDescriptionReturnsExpectedString() {
        XCTAssertEqual(AppAlert.logOut, "Do you really want to log out?")
        XCTAssertEqual(AppAlert.error, "Error")
    }
}
