import XCTest

final class AppAlertTests: XCTestCase {
    func testAllAppAlertsExistInAPI() {
        // Given
        let setOfAppAlerts = Set(AppAlert.allCases)

        // When
        let expectedAppAlerts: Set<AppAlert> = [
            .error,
            .logOut,
        ]

        // Then
        XCTAssertEqual(setOfAppAlerts, expectedAppAlerts)
    }
}
