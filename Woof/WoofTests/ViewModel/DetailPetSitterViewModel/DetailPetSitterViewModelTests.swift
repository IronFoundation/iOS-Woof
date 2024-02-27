import XCTest

final class DetailPetSitterViewModelTests: XCTestCase {
    func testDetailPetSitterViewModelExistsInAPI() {
        let sitter = Sitter(
            name: "Ann",
            surname: "Anderson",
            phone: "132451",
            avatarUrl: nil,
            bio: "Some random text",
            rating: 4.7,
            pricePerHour: 14,
            city: "Minsk"
        )

        _ = DetailSitterViewModel(sitter: sitter)
    }

    func testDetailPetSitterViewModelPropertiesReturnsExpectedValues() {
        let sitter = Sitter(
            name: "Ann",
            surname: "Anderson",
            phone: "132451",
            avatarUrl: nil,
            bio: "Some random text",
            rating: 4.0,
            pricePerHour: 14,
            city: "Minsk"
        )

        let viewModel = DetailSitterViewModel(sitter: sitter)

        XCTAssertEqual(viewModel.fullName, "\(sitter.name) \(sitter.surname)")
        XCTAssertEqual(viewModel.phoneNumber, sitter.phone)
        XCTAssertEqual(viewModel.bio, sitter.bio)
        XCTAssertEqual(viewModel.rating, .rated(.fourStars))
        XCTAssertEqual(viewModel.price, sitter.pricePerHour)
        XCTAssertNil(viewModel.imageURL)
    }
}
