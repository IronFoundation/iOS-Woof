import XCTest

final class AppButtonDescriptionTests: XCTestCase {
    func testAppButtonDescriptionReturnsExpectedString() {
        // Given
        let cancel = "Cancel"
        let save = "Save"
        let edit = "Edit"
        let tryAgain = "Try Again"
        let logout = "Logout"
        let `continue` = "Continue"

        // When // Then
        XCTAssertEqual(AppButton.cancel.rawValue, cancel)
        XCTAssertEqual(AppButton.save.rawValue, save)
        XCTAssertEqual(AppButton.edit.rawValue, edit)
        XCTAssertEqual(AppButton.tryAgain.rawValue, tryAgain)
        XCTAssertEqual(AppButton.logout.rawValue, logout)
        XCTAssertEqual(AppButton.continue.rawValue, `continue`)
    }
}
