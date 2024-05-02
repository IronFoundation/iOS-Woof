import SwiftUI

/// A view to onboard the sitter by filling in the mandatory information about themselves.
struct SitterOnboardingView: View {
    var body: some View {
        VStack {
            Text(welcomeText)
                .font(.title)
                .padding(.bottom, AppStyle.UIElementConstant.minPadding)

            Text(onboardingText)

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
                    .padding()
                    .font(.system(.footnote))
            }

            Button(proceedButtonTitle) {
                Task {
                    await viewModel.save()
                    if !viewModel.isErrorOccurred {
                        userRoleViewModel.setSitterRole()
                    }
                }
            }
            .buttonStyle(CapsuleWithWhiteText())
            .padding()
            .disabled(viewModel.mandatoryFieldsAreEmpty)
        }
        .foregroundColor(Color.App.purpleDark)
        .padding()
        .overlay {
            if viewModel.isSavingData {
                CustomProgressView()
            }
        }
        .alert(
            AppAlert.error,
            isPresented: $viewModel.isErrorOccurred,
            actions: {
                Button(AppButtonTitle.cancel) {}
                Button(AppButtonTitle.tryAgain) {
                    Task {
                        await viewModel.save()
                        if !viewModel.isErrorOccurred {
                            userRoleViewModel.setSitterRole()
                        }
                    }
                }
            },
            message: {
                Text(viewModel.errorMessage)
            }
        )
    }

    // MARK: - Private interface

    typealias SitterOnboardingViewModel = SitterProfileViewModel
    @StateObject private var viewModel = SitterOnboardingViewModel()
    @EnvironmentObject var userRoleViewModel: UserRoleViewModel

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
