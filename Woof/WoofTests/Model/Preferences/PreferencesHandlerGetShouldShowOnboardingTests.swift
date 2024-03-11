import XCTest

// swiftlint:disable:next type_name
final class PreferencesHandlerGetShouldShowOnboardingTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }
}
