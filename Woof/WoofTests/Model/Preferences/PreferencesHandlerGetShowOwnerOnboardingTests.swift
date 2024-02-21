import XCTest

// swiftlint:disable type_name
final class PreferencesHandlerGetShowOwnerOnboardingTests: XCTestCase {
    // swiftlint:enable type_name
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = PreferencesHandler.getShowOwnerOnboarding()
    }

    func testReturnsInitialValueForEmptyStorage() {
        // Given
        // the empty storage

        // When
        let loadedValue = PreferencesHandler.getShowOwnerOnboarding()

        // Then
        XCTAssertTrue(loadedValue)
    }

    func testReturnsChangedState() {
        // Given
        PreferencesHandler.set(showOwnerOnboarding: false)

        // When
        PreferencesHandler.set(showOwnerOnboarding: true)
        // Then
        XCTAssertEqual(PreferencesHandler.getShowOwnerOnboarding(), true)
    }
}
