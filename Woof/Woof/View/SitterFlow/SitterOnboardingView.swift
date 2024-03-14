import SwiftUI

/// A view to onboard the sitter by filling in the mandatory information about themselves.
struct SitterOnboardingView: View {
    /// View model responsible to manage data from model layer
    @StateObject var viewModel = SitterProfileViewModel()

    var body: some View {
        VStack {
            Text(welcomeText)
                .foregroundColor(Color.App.purpleDark)
                .font(.title)
                .padding(.bottom, AppStyle.UIElementConstant.minPadding)

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

            if viewModel.mandatoryFieldsAreEmpty {
                Text(mandatoryPlaceholderText)
                    .foregroundColor(Color.App.purpleDark)
                    .padding()
                    .font(.system(.footnote))
            }

            Button(proceedButtonTitle) {
                Task {
                    await viewModel.save()
                }
            }
            .buttonStyle(CapsuleWithWhiteText())
            .padding()
            .disabled(viewModel.mandatoryFieldsAreEmpty)
        }
        .padding()
    }

    // MARK: - Private interface

    private let welcomeText = "Hello👋🏻!"
    private let mandatoryPlaceholderText = "Fields with * are mandatory"
    private let proceedButtonTitle = "Start earning money!"
    private let onboardingText = """
    We're excited to have you on board as a pet sitter!
    Let's begin by entering your information:
    """
}

#Preview {
    SitterOnboardingView()
}
