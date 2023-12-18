import XCTest

final class AppButtonTitleDescriptionTests: XCTestCase {
    func testAppButtonTitleDescriptionReturnsExpectedString() {
        XCTAssertEqual(AppButtonTitle.cancel, "Cancel")
        XCTAssertEqual(AppButtonTitle.save, "Save")
        XCTAssertEqual(AppButtonTitle.edit, "Edit")
        XCTAssertEqual(AppButtonTitle.tryAgain, "Try Again")
        XCTAssertEqual(AppButtonTitle.logout, "Logout")
        XCTAssertEqual(AppButtonTitle.continue, "Continue")
    }
}
