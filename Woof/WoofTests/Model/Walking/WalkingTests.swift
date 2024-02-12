import XCTest

final class WalkingTests: XCTestCase {
    func testInitialization() {
        // Given // When
        let dummyWalking = Walking.Dummy.dummyWalking

        // Then
        XCTAssertEqual(dummyWalking.owner, Owner.Dummy.laraCroft)
        XCTAssertEqual(dummyWalking.sitter, Sitter.Dummy.emilyDoe)
        XCTAssertEqual(dummyWalking.status, WalkingStatus.available)
        XCTAssertEqual(dummyWalking.start, dummyWalking.start)
        XCTAssertEqual(dummyWalking.end, dummyWalking.end)
        XCTAssertEqual(dummyWalking.location?.longitude, 0.0)
        XCTAssertEqual(dummyWalking.location?.latitude, 0.0)
        XCTAssertEqual(dummyWalking.location?.address, "Sample Address")
        XCTAssertEqual(dummyWalking.reviews?.ownerReview, "")
        XCTAssertEqual(dummyWalking.reviews?.sitterReview, "")
        XCTAssertEqual(dummyWalking.rating?.ownerRating, 0)
        XCTAssertEqual(dummyWalking.rating?.sitterRating, 0)
        XCTAssertEqual(dummyWalking.notes, "Sample notes")
        XCTAssertEqual(dummyWalking.price, 28.0)
    }
}
