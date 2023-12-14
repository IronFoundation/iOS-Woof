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
        XCTAssertEqual(AppButton.cancel.description, cancel)
        XCTAssertEqual(AppButton.save.description, save)
        XCTAssertEqual(AppButton.edit.description, edit)
        XCTAssertEqual(AppButton.tryAgain.description, tryAgain)
        XCTAssertEqual(AppButton.logout.description, logout)
        XCTAssertEqual(AppButton.continue.description, `continue`)
    }
}
