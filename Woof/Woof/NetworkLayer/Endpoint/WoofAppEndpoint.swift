import NetworkService
///  Defines the production endpoints for the Woof app's API.
enum WoofAppEndpoint {
    /// Receiving all sitters from the server.
    case getAllSitters
    /// Adding a new pet sitter.
    case addNewSitter(BodyParameters?)
    /// Updating the information for the existing pet sitter.
    case updateSitter(BodyParameters?)
}
