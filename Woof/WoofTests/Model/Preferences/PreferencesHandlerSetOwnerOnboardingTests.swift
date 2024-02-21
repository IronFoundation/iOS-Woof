import XCTest

final class PreferencesHandlerSetOwnerOnboardingTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.set(showOwnerOnboarding: true)
    }

    func testOverridesThePreviouslySavedShowOwnerOnboardingValue() {
        // Given
        PreferencesHandler.set(showOwnerOnboarding: true)

        // When
        let result = PreferencesHandler.set(showOwnerOnboarding: false)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getShowOwnerOnboarding(), false)
    }
}
