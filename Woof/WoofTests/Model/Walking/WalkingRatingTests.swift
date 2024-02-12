import XCTest

final class WalkingRatingTests: XCTestCase {
    func testInitialization() {
        // Given // When
        let ownerRating = 4
        let sitterRating = 5

        let rating = Rating(ownerRating: ownerRating, sitterRating: sitterRating)

        // Then
        XCTAssertEqual(rating.ownerRating, ownerRating)
        XCTAssertEqual(rating.sitterRating, sitterRating)
    }
}
