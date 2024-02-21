import XCTest

// swiftlint:disable type_name
final class PreferencesHandlerSetShowOwnerOnboardingTests: XCTestCase {
    // swiftlint:enable type_name
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.set(showOwnerOnboarding: true)
    }

    func testOverridesThePreviouslySavedValue() {
        // Given
        PreferencesHandler.set(showOwnerOnboarding: true)

        // When
        let result = PreferencesHandler.set(showOwnerOnboarding: false)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getShowOwnerOnboarding(), false)
    }
}
