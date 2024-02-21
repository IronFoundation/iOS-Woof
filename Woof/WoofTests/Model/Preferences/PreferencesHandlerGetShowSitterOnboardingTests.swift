import XCTest

final class PreferencesHandlerGetSitterOnboardingTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.getShowSitterOnboarding()
    }

    func testReturnsInitialValueForEmptyStorage() {
        // Given
        // the empty storage

        // When
        let loadedValue = PreferencesHandler.getShowSitterOnboarding()

        // Then
        XCTAssertTrue(loadedValue)
    }

    func testReturnsChangedState() {
        // Given
        PreferencesHandler.set(showSitterOnboarding: true)

        // When
        PreferencesHandler.set(showSitterOnboarding: false)

        // Then
        XCTAssertEqual(PreferencesHandler.getShowSitterOnboarding(), false)
    }
}
