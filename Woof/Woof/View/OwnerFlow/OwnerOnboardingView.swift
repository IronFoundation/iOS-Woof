import SwiftUI

/// A view to onboard the owner by filling in the mandatory information about themselves.
struct OwnerOnboardingView: View {
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

            Button(proceedButtonTitle) {
                viewModel.save()
                if viewModel.errorMessage == nil {
                    userRoleViewModel.setOwnerRole()
                }
            }
            .buttonStyle(CapsuleWithWhiteText())
            .padding()
            .disabled(viewModel.mandatoryFieldsAreEmpty)
        }
        .alert(
            AppAlert.error,
            isPresented: .init(value: $viewModel.errorMessage),
            actions: {
                Button(AppButtonTitle.cancel) {}
                Button(AppButtonTitle.tryAgain) {
                    viewModel.save()
                }
            },
            message: {
                Text(viewModel.errorMessage ?? "")
            }
        )
        .padding()
    }

    // MARK: - Private interface

    typealias OwnerOnboardingViewModel = OwnerProfileViewModel
    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel
    @StateObject private var viewModel = OwnerOnboardingViewModel()
    private let proceedButtonTitle = "Find your pet sitter"
    private let welcomeText = "Hello👋🏻!"
    private let onboardingText = """
    We're almost ready to help you find a suitable pet-sitter for your beloved companion.
    Just specify a few details by entering your information:
    """
}

#Preview {
    OwnerOnboardingView()
}
