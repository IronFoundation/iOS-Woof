import SwiftUI

/// A view to onboard the owner by filling in the mandatory information about themselves.
struct OwnerOnboardingView: View {
    typealias OwnerOnboardingViewModel = OwnerProfileViewModel

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

            if viewModel.mandatoryFieldsAreEmpty {
                Text(mandatoryPlaceholderText)
                    .padding()
                    .font(.system(.footnote))
            }

            Button(proceedButtonTitle) {}
                .buttonStyle(CapsuleWithWhiteText())
                .padding()
                .disabled(viewModel.mandatoryFieldsAreEmpty)
        }
        .alert(
            AppAlert.error,
            isPresented: .init(value: $viewModel.errorMessage),
            actions: {
                Button(AppButtonTitle.cancel) {}
                Button(AppButtonTitle.tryAgain) {}
            },
            message: {
                Text(viewModel.errorMessage ?? "")
            }
        )
        .padding()
    }

    // MARK: - Private interface

    /// View model responsible to manage data from model layer
    @StateObject private var viewModel = OwnerOnboardingViewModel()
    private let proceedButtonTitle = "Find your pet sitter"
    private let welcomeText = "Hello👋🏻!"
    private let onboardingText = """
    We're almost ready to help you find a suitable pet-sitter for your beloved companion.
    Just specify a few details by entering your information:
    """
    private let mandatoryPlaceholderText = "Fields with * are mandatory"
}

#Preview {
    OwnerOnboardingView()
}
