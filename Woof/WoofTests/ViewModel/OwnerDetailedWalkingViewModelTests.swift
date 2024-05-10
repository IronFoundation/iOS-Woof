import XCTest

final class OwnerDetailedWalkingViewModelTests: XCTestCase {
    func testInitializedWithExpectedProperties() throws {
        // Given
        let walking = Walking.Dummy.dummyWalking

        let fullName =
            DataTransformer.fullName(
                name: walking.sitter.name,
                surname: walking.sitter.surname
            )
        let rating = DataTransformer.fiveStarRating(for: walking.sitter.rating)
        let phoneNumber = walking.sitter.phone
        let imageURL = walking.sitter.avatarUrl
        let address = try {
            let city = try XCTUnwrap(walking.owner?.city)
            let address = try XCTUnwrap(walking.owner?.address)
            return "\(city), \(address)"
        }()
        let price = walking.price
        let time = {
            let start = walking.start.formatted(date: .omitted, time: .shortened)
            let end = walking.end.formatted(date: .omitted, time: .shortened)
            return "\(start) - \(end)"
        }()
        let date = walking.start.formatted(date: .abbreviated, time: .omitted)
        let status = walking.status
        let notes = walking.notes

        // When
        let viewModel = OwnerDetailedWalkingViewModel(walking: walking)

        // Then
        XCTAssertEqual(viewModel.fullName, fullName)
        XCTAssertEqual(viewModel.rating, rating)
        XCTAssertEqual(viewModel.phoneNumber, phoneNumber)
        XCTAssertEqual(viewModel.imageURL, imageURL)
        XCTAssertEqual(viewModel.address, address)
        XCTAssertEqual(viewModel.price, price)
        XCTAssertEqual(viewModel.time, time)
        XCTAssertEqual(viewModel.date, date)
        XCTAssertEqual(viewModel.status, status)
        XCTAssertEqual(viewModel.notes, notes)
    }
}
