import XCTest

final class PreferencesHandlerSetSitterLoggedTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = PreferencesHandler.setSitterLoggedOnce(true)
    }

    func testOverridesThePreviouslySavedSitterLoggedOnceValue() {
        // Given
        PreferencesHandler.setSitterLoggedOnce(false)

        // When
        let result = PreferencesHandler.setSitterLoggedOnce(true)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getSitterLoggedOnce(), true)
    }
}
