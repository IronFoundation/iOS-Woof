import XCTest

final class WalkingReviewTests: XCTestCase {
    func testInitialization() {
        // Given // When
        let ownerReview = "Great service!"
        let sitterReview = "Excellent client!"

        let review = Review(ownerReview: ownerReview, sitterReview: sitterReview)

        // Then
        XCTAssertEqual(review.ownerReview, ownerReview)
        XCTAssertEqual(review.sitterReview, sitterReview)
    }
}
