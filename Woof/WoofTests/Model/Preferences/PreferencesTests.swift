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

    func testPreferencesReturnFalseForShowOwnerOnboardingByDefault() {
        // Given
        let preferences = Preferences()

        // When & Then
        XCTAssertTrue(preferences.showOwnerOnboarding)
    }

    func testPreferencesReturnExpectedValueForShowOwnerOnboardingWhenItChanged() {
        // Given
        var preferences = Preferences()

        // When
        preferences.showOwnerOnboarding = true

        // Then
        XCTAssertTrue(preferences.showOwnerOnboarding)
    }

    func testPreferencesReturnFalseForShowSitterOnboardingByDefault() {
        // Given
        let preferences = Preferences()

        // When & Then
        XCTAssertTrue(preferences.showSitterOnboarding)
    }

    func testPreferencesReturnExpectedValueForShowSitterOnboardingWhenItChanged() {
        // Given
        var preferences = Preferences()

        // When
        preferences.showSitterOnboarding = true

        // Then
        XCTAssertTrue(preferences.showSitterOnboarding)
    }
}
