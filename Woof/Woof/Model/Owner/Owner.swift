import Foundation

/**
 A person who owns a pet (or several pets) and might be interested in finding a pet sitter for them.
 */
struct Owner: Identifiable, Codable, Equatable {
    /// Uniquely identifies the pet owner.
    let id: UUID

    /// The first name of the pet owner.
    var name: String

    /// The last name of the pet owner.
    var surname: String

    /// The phone number of the pet owner.
    var phone: String

    /// URL that contains an avatar image of the pet owner.
    var avatarURL: URL?

    /// The owners city.
    var city: String

    /// The address of the pet owner.
    var address: String

    /// The rating of the pet owner, that should be provided in range 0 to 5.
    var rating: Double

    /**
     Creates an owner instance with the specified parameters with the unique identifier.

     - Parameters:
     - name: The first name of the pet owner.
     - surname: The last name of the pet owner.
     - phone: The phone number of the pet owner.
     - avatarURL: The URL that provides an avatar image of the pet owner.
     - address: The address of the pet owner.
     - rating: The rating of the pet owner.

     Each instance of the new owner has a unique id.
     */
    init(
        name: String,
        surname: String,
        phone: String,
        avatarURL: URL?,
        city: String,
        address: String,
        rating: Double
    ) {
        id = UUID()
        self.name = name
        self.surname = surname
        self.phone = phone
        self.avatarURL = avatarURL
        self.city = city
        self.address = address
        self.rating = rating
    }

    /**
     Creates a new owner instance with the specified parameters described below.

     The parameters of a new initialized instance are:
     - `name` is hardcoded value `User`;
     - `avatarUrl` is nil;
     - `rating` is equal 0;
     - other parameters are specified with the empty string ("").

     Each instance of the new owner has a unique id.
     */

    init() {
        self.init(
            name: "User",
            surname: "",
            phone: "",
            avatarURL: nil,
            city: "",
            address: "",
            rating: 0
        )
    }
}
