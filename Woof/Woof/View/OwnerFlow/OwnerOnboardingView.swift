import SwiftUI

/// A view to onboard the owner by filling in the mandatory information about themselves.
struct OwnerOnboardingView: View {
    /// View model responsible to manage data from model layer
    @ObservedObject var viewModel = OwnerOnboardingViewModel()

    /// A boolean indicating whether the save button should be enabled.
    var isSaveButtonEnabled: Bool {
        viewModel.name.isEmpty ||
            viewModel.phone.isEmpty ||
            viewModel.city.isEmpty ||
            viewModel.address.isEmpty
    }

    var body: some View {
        VStack {
            Text(welcomeText)
                .foregroundColor(Color.App.purpleDark)

            Text(onboardingText)
                .foregroundColor(Color.App.purpleDark)

            EditOwnerInformationView(
                name: $viewModel.name,
                surname: $viewModel.surname,
                phone: $viewModel.phone,
                city: $viewModel.city,
                address: $viewModel.address
            )

            Button(proceedButtonTitle) {}
                .buttonStyle(CapsuleWithWhiteText())
                .padding()
                .disabled(isSaveButtonEnabled)
        }
        .padding()
    }

    // MARK: - Private interface

    private let proceedButtonTitle = "Find your pet sitter"
    private let welcomeText = "Hello!"
    private let onboardingText = """
    We're almost ready to help you find a suitable pet-sitter for your beloved companion.
    Just specify a few details by entering your information:
    """
}

#Preview {
    OwnerOnboardingView()
}
