import XCTest

final class PreferencesHandlerGetOwnerLoggedTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = PreferencesHandler.getOwnerLoggedOnce()
    }

    func testReturnsInitialValueForGetOwnerLoggedOnceForEmptyStorage() {
        // Given
        // the empty storage

        // When
        let loadedValue = PreferencesHandler.getOwnerLoggedOnce()

        // Then
        XCTAssertFalse(loadedValue)
    }

    func testReturnsChangedState() {
        // Given
        PreferencesHandler.setOwnerLoggedOnce(false)

        // When
        PreferencesHandler.setOwnerLoggedOnce(true)

        // Then
        XCTAssertEqual(PreferencesHandler.getOwnerLoggedOnce(), true)
    }
}
