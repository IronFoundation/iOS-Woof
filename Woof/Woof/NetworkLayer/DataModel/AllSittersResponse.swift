/// Represents the data model that corresponds to the response data from the server.
struct AllSittersResponse: Decodable {
    /// A list of sitters in the data response.
    let petSitters: [Sitter]?

    enum CodingKeys: String, CodingKey {
        #if DEBUG
            case petSitters = "testPetSitters"
        #else
            case petSitters = "petSitters"
        #endif
    }
}
