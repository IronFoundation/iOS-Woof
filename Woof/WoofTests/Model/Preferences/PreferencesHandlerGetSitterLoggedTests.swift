import XCTest

final class PreferencesHandlerGetSitterLoggedTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = PreferencesHandler.getSitterLoggedOnce()
    }

    func testReturnsInitialValueForGetOwnerLoggedOnceForEmptyStorage() {
        // Given
        // the empty storage

        // When
        let loadedValue = PreferencesHandler.getSitterLoggedOnce()

        // Then
        XCTAssertFalse(loadedValue)
    }

    func testReturnsChangedState() {
        // Given
        PreferencesHandler.setSitterLoggedOnce(false)

        // When
        PreferencesHandler.setSitterLoggedOnce(true)

        // Then
        XCTAssertEqual(PreferencesHandler.getSitterLoggedOnce(), true)
    }
}
