import XCTest

final class WalkingRatingTests: XCTestCase {
    func testInitialization() {
        // Given // When
        let ownerRating = 4.0
        let sitterRating = 5.0

        let rating = Rating(ownerRating: ownerRating, sitterRating: sitterRating)

        // Then
        XCTAssertEqual(rating.ownerRating, ownerRating)
        XCTAssertEqual(rating.sitterRating, sitterRating)
    }
}
