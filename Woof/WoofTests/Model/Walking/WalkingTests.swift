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
        XCTAssertEqual(dummyWalking.ownerRating, 4)
        XCTAssertEqual(dummyWalking.sitterRating, 5)
        XCTAssertEqual(dummyWalking.ownerReview, "")
        XCTAssertEqual(dummyWalking.sitterReview, "")
        XCTAssertEqual(dummyWalking.notes, "Sample notes")
        XCTAssertEqual(dummyWalking.price, 28.0)
    }
}
