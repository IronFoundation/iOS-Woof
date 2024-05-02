import XCTest

final class LoginViewModelTests: XCTestCase {
    private var viewModel = LoginViewModel()

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()

        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .deleteData(for: KeyValueStorage.Key.currentOwner)
        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .deleteData(for: KeyValueStorage.Key.currentSitter)
    }

    func testLoginViewModelExistInAPI() {
        _ = viewModel
    }

    func testOwnerFlowDidSelected_givenNoSavedOwner_whenIsCalled_thenShouldShowOwnerOnboardingIsTrue() {
        // Given // When
        viewModel.ownerFlowDidSelected()

        // Then
        XCTAssertTrue(viewModel.shouldShowOwnerOnboarding)
    }

    func testSitterFlowDidSelected_givenNoSavedSitter_whenIsCalled_thenShouldShowSitterOnboardingIsTrue() {
        // Given // When
        viewModel.sitterFlowDidSelected()

        // Then
        XCTAssertTrue(viewModel.shouldShowSitterOnboarding)
    }

    func testOwnerFlowDidSelected_givenSavedOwnerExists_whenIsCalled_thenShouldShowOwnerOnboardingIsFalse() {
        // Given
        saveNewOwner()

        // When
        viewModel.ownerFlowDidSelected()

        // Then
        XCTAssertFalse(viewModel.shouldShowOwnerOnboarding)
    }

    func testSitterFlowDidSelected_givenSavedSitterExists_whenIsCalled_thenShouldShowSitterOnboardingIsFalse() {
        // Given
        saveNewSitter()

        // When
        viewModel.sitterFlowDidSelected()

        // Then
        XCTAssertFalse(viewModel.shouldShowSitterOnboarding)
    }

    // MARK: - Private Interface

    private func saveNewOwner() {
        let newOwner = Owner()

        guard let data = try? JSONEncoder().encode(newOwner) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .save(data, for: KeyValueStorage.Key.currentOwner)
    }

    private func saveNewSitter() {
        let newSitter = Sitter()

        guard let data = try? JSONEncoder().encode(newSitter) else { return }

        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .save(data, for: KeyValueStorage.Key.currentSitter)
    }
}
