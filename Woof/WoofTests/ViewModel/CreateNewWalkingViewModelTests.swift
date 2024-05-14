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

    func testCreatedWalkingStatusMatchExpectedStatus() {
        // Given
        let startTime = Date()
        let durationInMinutes = 30
        let repeatInterval = WalkingRepeatInterval.never
        let viewModel = setupViewModel(startTime: startTime,
                                       durationInMinutes: durationInMinutes,
                                       repeatInterval: repeatInterval)

        // When
        let walkingObjectsResult = viewModel.createWalkingsForRepeatInterval()

        // Then
        switch walkingObjectsResult {
        case let .success(walkingObjects):
            XCTAssertEqual(walkingObjects[0].status, WalkingStatus.available)
        case let .failure(error):
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testCreatedWalkingEndTimeMatchExpectedEndTime() {
        // Given
        let calendar = Calendar.current
        let startDateComponents = DateComponents(year: 2024, month: 10, day: 12, hour: 12)
        let endDateComponents = DateComponents(year: 2024, month: 10, day: 12, hour: 13)
        guard let startTime = calendar.date(from: startDateComponents) else {
            fatalError("Failed to create date")
        }
        guard let expectedEndTime = calendar.date(from: endDateComponents) else {
            fatalError("Failed to create date")
        }
        let durationInMinutes = 60
        let repeatInterval = WalkingRepeatInterval.never
        let viewModel = setupViewModel(startTime: startTime,
                                       durationInMinutes: durationInMinutes,
                                       repeatInterval: repeatInterval)

        // When
        let walkingObjectsResult = viewModel.createWalkingsForRepeatInterval()

        // Then
        switch walkingObjectsResult {
        case let .success(walkingObjects):
            XCTAssertEqual(walkingObjects[0].end, expectedEndTime)
        case let .failure(error):
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testCreatedWalkingForOneDateReturnsOneWalkingObject() {
        // Given
        let startTime = Date()
        let durationInMinutes = 30
        let repeatInterval = WalkingRepeatInterval.never
        let viewModel = setupViewModel(startTime: startTime,
                                       durationInMinutes: durationInMinutes,
                                       repeatInterval: repeatInterval)

        // When
        let walkingObjectsResult = viewModel.createWalkingsForRepeatInterval()

        // Then
        switch walkingObjectsResult {
        case let .success(walkingObjects):
            XCTAssertEqual(walkingObjects.count, 1)
        case let .failure(error):
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testCreatedWalkingForWeeklyIntervalReturnsExpectedNumberOfWalkingObjects() {
        // Given
        let startTime = Date()
        let durationInMinutes = 30
        let repeatInterval = WalkingRepeatInterval.weekly
        let viewModel = setupViewModel(startTime: startTime,
                                       durationInMinutes: durationInMinutes,
                                       repeatInterval: repeatInterval)

        // When
        let walkingObjectsResult = viewModel.createWalkingsForRepeatInterval()

        // Then
        switch walkingObjectsResult {
        case let .success(walkingObjects):
            let currentYear = Calendar.current.component(.year, from: startTime)
            let expectedWalkingCount = Calendar.current.isLeapYear(year: currentYear) ? 53 : 52
            XCTAssertEqual(walkingObjects.count, expectedWalkingCount)
        case let .failure(error):
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testCreatedWalkingForBiWeeklyIntervalReturnsExpectedNumberOfWalkingObjects() {
        // Given
        let startTime = Date()
        let durationInMinutes = 30
        let repeatInterval = WalkingRepeatInterval.biweekly
        let viewModel = setupViewModel(startTime: startTime,
                                       durationInMinutes: durationInMinutes,
                                       repeatInterval: repeatInterval)

        // When
        let walkingObjectsResult = viewModel.createWalkingsForRepeatInterval()

        // Then
        switch walkingObjectsResult {
        case let .success(walkingObjects):
            let currentYear = Calendar.current.component(.year, from: startTime)
            let isLeapYear = Calendar.current.isLeapYear(year: currentYear)

            if isLeapYear {
                if let lastDayOfYear = Calendar.current.date(from: DateComponents(year: currentYear,
                                                                                  month: 12,
                                                                                  day: 31)),
                    let nextDayAfterLastDayOfYear = Calendar.current.date(byAdding: .day,
                                                                          value: 1,
                                                                          to: lastDayOfYear) {
                    if Calendar.current.component(.weekOfYear, from: nextDayAfterLastDayOfYear) == 1 {
                        XCTAssertEqual(walkingObjects.count, 27)
                    } else {
                        XCTAssertEqual(walkingObjects.count, 26)
                    }
                } else {
                    XCTFail("Failed to calculate the last day of the year.")
                }
            } else {
                XCTAssertEqual(walkingObjects.count, 26)
            }

        case let .failure(error):
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testCreatedWalkingForDailyIntervalReturnsExpectedNumberOfWalkingObjects() {
        // Given
        let startTime = Date()
        let durationInMinutes = 30
        let repeatInterval = WalkingRepeatInterval.daily
        let viewModel = setupViewModel(startTime: startTime,
                                       durationInMinutes: durationInMinutes,
                                       repeatInterval: repeatInterval)

        // When
        let walkingObjectsResult = viewModel.createWalkingsForRepeatInterval()

        // Then
        switch walkingObjectsResult {
        case let .success(walkingObjects):
            let currentYear = Calendar.current.component(.year, from: Date())
            let expectedWalkingCount = Calendar.current.isLeapYear(year: currentYear) ? 366 : 365
            XCTAssertEqual(walkingObjects.count, expectedWalkingCount)
        case let .failure(error):
            XCTFail("Unexpected error: \(error)")
        }
    }

    private func setupViewModel(
        startTime: Date,
        durationInMinutes: Int,
        repeatInterval: WalkingRepeatInterval
    ) -> CreateNewWalkingViewModel {
        let viewModel = CreateNewWalkingViewModel()
        viewModel.startTime = startTime
        viewModel.durationInMinutes = durationInMinutes
        viewModel.repeatInterval = repeatInterval
        return viewModel
    }
}

extension Calendar {
    func isLeapYear(year: Int) -> Bool {
        (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    }
}
