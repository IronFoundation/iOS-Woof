import XCTest

final class APIEnvironmentTests: XCTestCase {
    func testAllEnvironmentsExistInAPI() {
        // Given
        let setOfAPIEnvironments = Set(APIEnvironment.allCases)

        // When
        let expectedAPIEnvironments: Set<APIEnvironment> = [
            .production,
            .staging,
        ]

        // Then
        XCTAssertEqual(setOfAPIEnvironments, expectedAPIEnvironments)
    }

    func testEnvironmentHasExpectedBaseURL() {
        XCTAssertEqual(APIEnvironment.production.baseURL, URL(string: "https://woof-app.hasura.app/api/rest/"))
        XCTAssertEqual(APIEnvironment.staging.baseURL, URL(string: "https://woof-app-test.hasura.app/api/rest/"))
    }
}
