import XCTest

final class PreferencesTests: XCTestCase {
    func testPreferencesExistInAPI() {
        _ = Preferences()
    }

    func testPreferencesReturnNoneForSelectedRoleWhenNewInstancePreferencesInitialized() {
        let preferences = Preferences()

        XCTAssertEqual(preferences.selectedRole, .none)
    }

    func testPreferencesReturnExpectedValueForSelectedRoleWhenItChangedToSitterRole() {
        var preferences = Preferences()
        preferences.selectedRole = .sitter

        XCTAssertEqual(preferences.selectedRole, Role.sitter)
    }

    func testPreferencesReturnExpectedValueForSelectedRoleWhenItChangedToOwnerRole() {
        var preferences = Preferences()
        preferences.selectedRole = .owner

        XCTAssertEqual(preferences.selectedRole, Role.owner)
    }

    func testPreferencesInitializedWithExpectedDefaultValueForShouldShowOnboarding() {
        // Given
        let preferences = Preferences()

        // When & Then
        XCTAssertTrue(preferences.shouldShowOnboarding)
    }

    func testPreferencesReturnExpectedValueForShouldShowOnboardingWhenItChanged() {
        // Given
        var preferences = Preferences()

        // When
        preferences.shouldShowOnboarding = false

        // Then
        XCTAssertFalse(preferences.shouldShowOnboarding)
    }
}
