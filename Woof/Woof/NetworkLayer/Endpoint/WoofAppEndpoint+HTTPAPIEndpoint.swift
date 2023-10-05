import Foundation
import NetworkService

///  Defines the production endpoints for the Woof app's API.
extension WoofAppEndpoint: HTTPAPIEndpoint {
    // MARK: - Internal interface

    typealias Environment = APIEnvironment

    static var networkEnvironment = Environment.production

    var baseURL: URL {
        Self.baseProdURL
    }

    var path: String {
        switch self {
        case .getAllSitters: return Path.getAllSitters
        case .addNewSitter: return Path.addNewSitter
        case .updateSitter: return Path.updateSitter
        }
    }

    var task: HTTPTask {
        switch self {
        case .getAllSitters: return .request
        case let .addNewSitter(parameters):
            return .requestWithBodyParameters(bodyParameters: parameters)
        case let .updateSitter(parameters):
            return .requestWithBodyParameters(bodyParameters: parameters)
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getAllSitters: return .get
        case .addNewSitter: return .post
        case .updateSitter: return .put
        }
    }

    var headers: HTTPHeaders {
        switch Self.networkEnvironment {
        case .production:
            return [Self.authHeader: Self.revealedKey]
        case .staging:
            return [:]
        }
    }

    // MARK: - Private interface

    private static let baseProdURL = URL(string: "https://woof-app.hasura.app/api/rest/") ?? Bundle.main.bundleURL
    private static let authHeader = "x-hasura-admin-secret"
    private static let obfuscatedKey = ""
    private static let salt = ""

    private static var revealedKey: String {
        do {
            return try Obfuscator.reveal(obfuscatedKey, salt: salt)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
