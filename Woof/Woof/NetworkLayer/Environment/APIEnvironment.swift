import Foundation
/// Represents the possible environments for API communication.
enum APIEnvironment: CaseIterable {
    /// The production environment for live, real-world data.
    case production

    /// The staging environment for testing and development purposes.
    case staging

    /// The base URL used for specified environment.
    var baseURL: URL {
        switch self {
        case .production:
            return URL(string: "https://woof-app.hasura.app/api/rest/") ?? Bundle.main.bundleURL
        case .staging:
            return URL(string: "https://woof-app-test.hasura.app/api/rest/") ?? Bundle.main.bundleURL
        }
    }
}
