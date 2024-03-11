import XCTest

// swiftlint:disable:next type_name
final class PreferencesHandlerGetShouldShowOnboardingTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.getShouldShowOnboarding()
    }

    func testReturnsInitialValueForEmptyStorage() {
        // Given // When
        let loadedValue = PreferencesHandler.getShouldShowOnboarding()

        // Then
        XCTAssertTrue(loadedValue)
    }

    func testReturnsChangedState() {
        // Given // When
        PreferencesHandler.setShouldShowOnboarding(false)

        // Then
        XCTAssertEqual(PreferencesHandler.getShouldShowOnboarding(), false)
    }
}
