import XCTest

final class CreateNewWalkingViewModelTests: XCTestCase {
    var sitter: Sitter!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sitter = Sitter.Dummy.sitters[0]
        do {
            let encodedSitter = try JSONEncoder().encode(sitter)
            KeyValueStorage(KeyValueStorage.Name.currentSitter)
                .save(encodedSitter, for: KeyValueStorage.Key.currentSitter)
        } catch {
            XCTFail("Failed to encode sitter: \(error)")
        }
    }

    func testCreatingWalkingWithOneDateObjectsReturnsExpectedNumberOfWalkingObjects() {
        // Given
        let viewModel = setupViewModel(startTime: Date(),
                                       durationInMinutes: 30,
                                       selectedDates: [Date()])

        // When
        let walkingObjects = viewModel.createWalkingObjects()

        // Then
        XCTAssertEqual(walkingObjects.count, 1)
    }

    func testCreatingWalkingObjectsWithMultipleDatesReturnsExpectedNumberOfWalkingObjects() {
        // Given
        let viewModel = setupViewModel(startTime: Date(),
                                       durationInMinutes: 30,
                                       selectedDates: [
                                           Date(),
                                           Date().addingTimeInterval(14400),
                                           Date().addingTimeInterval(32800),
                                       ])

        // When
        let walkingObjects = viewModel.createWalkingObjects()

        // Then
        XCTAssertEqual(walkingObjects.count, 3)
    }

    func testCreatingWalkingObjectsWithOneDateReturnsCorrectPriceAndSitterData() {
        // Given
        let viewModel = setupViewModel(startTime: Date(),
                                       durationInMinutes: 30,
                                       selectedDates: [Date()])

        // When
        let walkingObjects = viewModel.createWalkingObjects()

        // Then
        guard let walking = walkingObjects.first else {
            XCTFail("No walking objects created")
            return
        }

        XCTAssertEqual(walking.price, 10.0)
        XCTAssertEqual(walking.sitter, sitter)
    }

    func testCreatingWalkingObjectsWithDurationLessThanMinimumReturnsNoWalkingObjects() {
        // Given
        let viewModel = setupViewModel(startTime: Date(),
                                       durationInMinutes: 15,
                                       selectedDates: [Date()])

        // When
        let walkingObjects = viewModel.createWalkingObjects()

        // Then
        XCTAssertEqual(walkingObjects.count, 0)
    }

    func testCreatingWalkingObjectsWithDurationMoreThanMaximumReturnsNoWalkingObjects() {
        // Given
        let viewModel = setupViewModel(startTime: Date(),
                                       durationInMinutes: 150,
                                       selectedDates: [Date()])

        // When
        let walkingObjects = viewModel.createWalkingObjects()

        // Then
        XCTAssertEqual(walkingObjects.count, 0)
    }

    private func setupViewModel(
        startTime: Date,
        durationInMinutes: Int,
        selectedDates: [Date]
    ) -> CreateNewWalkingViewModel {
        let viewModel = CreateNewWalkingViewModel()
        viewModel.startTime = startTime
        viewModel.durationInMinutes = durationInMinutes
        viewModel.selectedDates = Set(selectedDates)
        return viewModel
    }
}
