import XCTest

// swiftlint:disable:next type_name
final class PreferencesHandlerSetShouldShowOnboardingTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.setShouldShowOnboarding(true)
    }

    func testMethodSuccessfullyOverridesThePreviouslySavedValue() {
        // Given
        PreferencesHandler.setShouldShowOnboarding(true)

        // When
        let result = PreferencesHandler.setShouldShowOnboarding(false)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getShouldShowOnboarding(), false)
    }
}
