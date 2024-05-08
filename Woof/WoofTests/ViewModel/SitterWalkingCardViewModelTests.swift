import XCTest

final class SitterWalkingCardViewModelTests: XCTestCase {
    func testInitializedWithExpectedProperties() {
        // Given
        let walking = Walking.Dummy.dummyWalking

        let date = walking.start.formatted(date: .abbreviated, time: .omitted)
        let status = walking.status
        let city = walking.owner?.city ?? "unexpected value"
        let address = walking.owner?.address ?? "unexpected value"
        let price = walking.price

        let fullName = DataTransformer.fullName(
            name: walking.owner?.name ?? "unexpected value",
            surname: walking.owner?.surname ?? "unexpected value"
        )

        let time = {
            let start = walking.start.formatted(date: .omitted, time: .shortened)
            let end = walking.end.formatted(date: .omitted, time: .shortened)

            return "\(start) - \(end)"
        }()

        // When
        let viewModel = SitterWalkingCardViewModel(walking: walking)

        // Then
        XCTAssertEqual(viewModel.fullName, fullName)
        XCTAssertEqual(viewModel.city, city)
        XCTAssertEqual(viewModel.address, address)
        XCTAssertEqual(viewModel.price, price)
        XCTAssertEqual(viewModel.time, time)
        XCTAssertEqual(viewModel.date, date)
        XCTAssertEqual(viewModel.status, status)
    }
}
