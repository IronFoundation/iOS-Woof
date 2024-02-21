import XCTest

// swiftlint:disable type_name
final class PreferencesHandlerSetShowSitterOnboardingTests: XCTestCase {
    // swiftlint:enable type_name
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.set(showSitterOnboarding: true)
    }

    func testMethodSuccesfullyOverridesThePreviouslySavedValue() {
        // Given
        PreferencesHandler.set(showSitterOnboarding: true)

        // When
        let result = PreferencesHandler.set(showSitterOnboarding: false)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getShowSitterOnboarding(), false)
    }
}
