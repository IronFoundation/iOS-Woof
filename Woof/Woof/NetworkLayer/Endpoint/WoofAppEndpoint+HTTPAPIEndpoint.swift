import Foundation
import NetworkService

///  Defines the production endpoints for the Woof app's API.
extension WoofAppEndpoint: HTTPAPIEndpoint {
    // MARK: - Internal interface

    typealias Environment = APIEnvironment

    #if DEBUG
        static var networkEnvironment = Environment.staging
    #else
        static var networkEnvironment = Environment.production
    #endif

    var baseURL: URL {
        Self.networkEnvironment.baseURL
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
        [Self.authHeader: Self.revealedKey]
    }

    // MARK: - Private interface

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
