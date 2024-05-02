import SwiftUI

/// A view that allows the user to select a role in the application.
struct LoginView: View {
    // MARK: - Internal interface

    var body: some View {
        NavigationView {
            VStack {
                Button(ownerButtonText) {
                    viewModel.ownerFlowDidSelected()
                    if !viewModel.shouldShowOwnerOnboarding {
                        userRoleViewModel.setOwnerRole()
                    }
                }

                Button(sitterButtonText) {
                    viewModel.sitterFlowDidSelected()
                    if !viewModel.shouldShowSitterOnboarding {
                        userRoleViewModel.setSitterRole()
                    }
                }
            }
            .background {
                NavigationLink(
                    destination: OwnerOnboardingView(),
                    isActive: $viewModel.shouldShowOwnerOnboarding
                ) { EmptyView() }

                NavigationLink(
                    destination: SitterOnboardingView(),
                    isActive: $viewModel.shouldShowSitterOnboarding
                ) { EmptyView() }
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()
        }
    }

    // MARK: - Private interface

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel

    @StateObject private var viewModel = LoginViewModel()

    private let ownerButtonText = "I am a pet owner"
    private let sitterButtonText = "I am a pet sitter"
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserRoleViewModel())
    }
}
