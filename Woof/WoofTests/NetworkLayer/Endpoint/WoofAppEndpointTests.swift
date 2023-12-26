import NetworkService
import XCTest

final class WoofAppEndpointTests: XCTestCase {
    func testAllWoofAppEndpointPropertiesAreAvailable() {
        let _ = WoofAppEndpoint.networkEnvironment
    }

    func testAllCasesForWoofAppEndpointExists() {
        let _ = WoofAppEndpoint.addNewSitter(nil)
        let _ = WoofAppEndpoint.updateSitter(nil)
        let _ = WoofAppEndpoint.getAllSitters
    }

    func testAddNewSitterEndpointIsConfiguredCorrectly() {
        // Given
        let parameters = Sitter().asDictionary()

        // When
        let endpoint = WoofAppEndpoint.addNewSitter(parameters)

        // Then
        XCTAssertEqual(endpoint.baseURL, baseURL)
        XCTAssertEqual(endpoint.path, WoofAppEndpoint.Path.addNewSitter)
        XCTAssertTrue(endpoint.headers.keys.contains(authHeader))

        switch endpoint.method {
        case .post: break
        default: XCTFail("Unexpected scenario.")
        }

        switch endpoint.task {
        case .requestWithBodyParameters: break
        default: XCTFail("Unexpected scenario.")
        }
    }

    func testGetAllSittersEndpointIsConfiguredCorrectly() {
        // Given // When
        let endpoint = WoofAppEndpoint.getAllSitters

        // Then
        XCTAssertEqual(endpoint.baseURL, baseURL)
        XCTAssertEqual(endpoint.path, WoofAppEndpoint.Path.getAllSitters)
        XCTAssertTrue(endpoint.headers.keys.contains(authHeader))

        switch endpoint.method {
        case .get: break
        default: XCTFail("Unexpected scenario.")
        }

        switch endpoint.task {
        case .request: break
        default: XCTFail("Unexpected scenario.")
        }
    }

    func testUpdateSitterEndpointIsConfiguredCorrectly() {
        // Given
        let parameters = Sitter().asDictionary()

        // When
        let endpoint = WoofAppEndpoint.updateSitter(parameters)

        // Then
        XCTAssertEqual(endpoint.baseURL, baseURL)
        XCTAssertEqual(endpoint.path, WoofAppEndpoint.Path.updateSitter)
        XCTAssertTrue(endpoint.headers.keys.contains(authHeader))

        switch endpoint.method {
        case .put: break
        default: XCTFail("Unexpected scenario.")
        }

        switch endpoint.task {
        case .requestWithBodyParameters: break
        default: XCTFail("Unexpected scenario.")
        }
    }

    // MARK: - Private interface

    private let baseURL = URL(string: "https://woof-app-test.hasura.app/api/rest/") ?? Bundle.main.bundleURL
    private let authHeader = "x-hasura-admin-secret"
}
