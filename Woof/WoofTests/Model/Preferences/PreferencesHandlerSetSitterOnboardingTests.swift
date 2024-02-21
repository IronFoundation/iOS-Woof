import XCTest

final class PreferencesHandlerSetSitterOnboardingTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.set(showSitterOnboarding: true)
    }

    func testOverridesThePreviouslySavedShowSitterOnboardingValue() {
        // Given
        PreferencesHandler.set(showSitterOnboarding: true)

        // When
        let result = PreferencesHandler.set(showSitterOnboarding: false)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getShowSitterOnboarding(), false)
    }
}
