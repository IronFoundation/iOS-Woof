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

    func testPreferencesReturnFalseForIsOwnerLoggedOnceByDefault() {
        // Given
        let preferences = Preferences()

        // When & Then
        XCTAssertFalse(preferences.isOwnerLoggedOnce)
    }

    func testPreferencesReturnExpectedValueForIsOwnerLoggedOnceWhenItChanged() {
        // Given
        var preferences = Preferences()

        // When
        preferences.isOwnerLoggedOnce = true

        // Then
        XCTAssertTrue(preferences.isOwnerLoggedOnce)
    }

    func testPreferencesReturnFalseForIsSitterLoggedOnceByDefault() {
        // Given
        let preferences = Preferences()

        // When & Then
        XCTAssertFalse(preferences.isSitterLoggedOnce)
    }

    func testPreferencesReturnExpectedValueForIsSitterLoggedOnceWhenItChanged() {
        // Given
        var preferences = Preferences()

        // When
        preferences.isSitterLoggedOnce = true

        // Then
        XCTAssertTrue(preferences.isSitterLoggedOnce)
    }
}
