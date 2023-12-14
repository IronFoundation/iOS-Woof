import XCTest

final class AppButtonTests: XCTestCase {
    func testAllAppButtonsExistInAPI() {
        // Given
        let setOfAppButtons = Set(AppButton.allCases)

        // When
        let expectedAppButtons: Set<AppButton> = [
            .cancel,
            .continue,
            .edit,
            .logout,
            .save,
            .tryAgain,
        ]

        // Then
        XCTAssertEqual(setOfAppButtons, expectedAppButtons)
    }
}
