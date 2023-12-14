import XCTest

final class AppAlertDescriptionTests: XCTestCase {
    func testAppAlertDescriptionReturnsExpectedString() {
        // Given
        let logOut = "Do you really want to log out?"
        let error = "Error"

        // When // Then
        XCTAssertEqual(AppAlert.logOut.description, logOut)
        XCTAssertEqual(AppAlert.error.description, error)
    }
}
