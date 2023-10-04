extension WoofAppEndpoint {
    /// Represents endpoint paths for the application.
    enum Path {
        /// The path to get sitters.
        static let getAllSitters = "pet_sitters/all"
        /// The path for adding a new pet sitter.
        static let addNewSitter = "pet_sitters/new"
        /// The path to update the existing sitter.
        static let updateSitter = "pet_sitters/update"
    }
}
