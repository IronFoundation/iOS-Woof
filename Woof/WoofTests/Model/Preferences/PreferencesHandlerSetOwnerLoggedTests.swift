import XCTest

final class PreferencesHandlerSetOwnerLoggedTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = PreferencesHandler.setOwnerLoggedOnce(true)
    }

    func testOverridesThePreviouslySavedOwnerLoggedOnceValue() {
        // Given
        PreferencesHandler.setOwnerLoggedOnce(false)

        // When
        let result = PreferencesHandler.setOwnerLoggedOnce(true)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getOwnerLoggedOnce(), true)
    }
}
