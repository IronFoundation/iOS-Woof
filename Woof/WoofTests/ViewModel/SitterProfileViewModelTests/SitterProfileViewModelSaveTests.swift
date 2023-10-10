import NetworkService
import XCTest

final class SitterProfileViewModelSaveTests: XCTestCase {
    private var viewModel: SitterProfileViewModel!

    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(MockURLProtocol.self)
        viewModel = SitterProfileViewModel()
    }

    override func tearDown() {
        KeyValueStorage.clearStoredSitterData()
        URLProtocol.unregisterClass(MockURLProtocol.self)
        viewModel = nil
        super.tearDown()
    }

    func testSaveMethodExistsInAPI() async {
        await SitterProfileViewModel().save()
    }

    func testSaveMethodSuccessfullySavedChangedSitterProperties() async {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        let newName = Sitter.Test.johnSmith.name
        let newSurname = Sitter.Test.johnSmith.surname
        let newPhone = Sitter.Test.johnSmith.phone
        let newBio = Sitter.Test.johnSmith.bio
        let newPricePerHour = Sitter.Test.johnSmith.pricePerHour

        viewModel.name = newName
        viewModel.surname = newSurname
        viewModel.phone = newPhone
        viewModel.bio = newBio
        viewModel.pricePerHour = String(newPricePerHour)

        // When
        await viewModel.save()

        // Then
        let currentSitter = SitterProfileViewModel()

        XCTAssertEqual(currentSitter.name, newName)
        XCTAssertEqual(currentSitter.surname, newSurname)
        XCTAssertEqual(currentSitter.phone, newPhone)
        XCTAssertEqual(currentSitter.bio, newBio)
        XCTAssertEqual(currentSitter.pricePerHour, String(newPricePerHour))
    }

    func testSaveMethodCallsUploadMethodWithoutTriggeringError() async {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        // When
        await viewModel.save()

        // Then
        XCTAssertEqual(viewModel.isErrorOccurred, false)
    }

    func testAllErrorStatusCodesInResponseTriggersError() async {
        // Given
        for statusCode in [300, 400, 401, 402, 500] {
            MockURLProtocol.requestHandler = { request in
                let response = try XCTUnwrap(
                    HTTPURLResponse(
                        url: XCTUnwrap(request.url),
                        statusCode: statusCode,
                        httpVersion: nil,
                        headerFields: nil
                    )
                )
                return (response, nil)
            }

            // When
            await viewModel.save()

            // Then
            XCTAssertEqual(viewModel.isErrorOccurred, true, "Error not triggered for status code \(statusCode)")
        }
    }

    func testSaveSendsExpectedNumberOfRequests() async {
        // Given
        var requestCount = 0

        MockURLProtocol.requestHandler = { request in
            requestCount += 1

            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        // When
        await viewModel.save()

        // Then
        XCTAssertEqual(requestCount, 1)
    }

    func testFirstSavedSitterChangesSitterIsSetPropertyOnTrue() async {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        // When
        let sitterIsSetBeforeSave = viewModel.sitterIsSet
        await viewModel.save()

        // Then
        XCTAssertNotEqual(sitterIsSetBeforeSave, viewModel.sitterIsSet)
    }

    func testSitterIsSetIsTrueWhenSaveIsCalledRepeatedly() async {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        // When
        await viewModel.save()
        await viewModel.save()

        // Then
        XCTAssertTrue(viewModel.sitterIsSet)
    }
}
