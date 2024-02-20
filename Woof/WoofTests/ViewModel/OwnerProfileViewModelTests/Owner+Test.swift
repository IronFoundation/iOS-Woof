import Foundation

extension Owner {
    /// Data used in unit tests.
    enum Test {
        /// The instance of dummy owner.
        static let kateAnderson = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "phone",
            avatarURL: Bundle.main.url(forResource: "JohnAlisonAvatar", withExtension: "jpg"),
            city: "test city",
            address: "test address",
            rating: 3.2
        )
    }
}
