import SwiftUI

/// A view to onboard the sitter by filling in the mandatory information about themselves.
struct SitterOnboardingView: View {
    /// View model responsible to manage data from model layer
    @ObservedObject var viewModel = SitterOnboardingViewModel()

    /// A boolean indicating whether the save button should be enabled.
    var isSaveButtonEnabled: Bool {
        viewModel.name.isEmpty ||
            viewModel.phone.isEmpty ||
            viewModel.city.isEmpty ||
            viewModel.pricePerHour.isEmpty
    }

    var body: some View {
        VStack {
            Text(welcomeText)
                .foregroundColor(Color.App.purpleDark)

            Text(onboardingText)
                .foregroundColor(Color.App.purpleDark)

            EditSitterInformationView(
                name: $viewModel.name,
                surname: $viewModel.surname,
                phone: $viewModel.phone,
                city: $viewModel.city,
                bio: $viewModel.bio,
                pricePerHour: $viewModel.pricePerHour
            )

            Button(proceedButtonTitle) {}
                .buttonStyle(CapsuleWithWhiteText())
                .padding()
                .disabled(isSaveButtonEnabled)
        }
        .padding()
    }

    // MARK: - Private interface

    private let welcomeText = "Hello!"
    private let proceedButtonTitle = "Start earn money!"
    private let onboardingText = """
    We're excited to have you on board as a pet sitter!
    Your dedication and care will make a world of difference to pets in need. Let's begin by entering your information:
    """
}

#Preview {
    SitterOnboardingView()
}
