import SwiftUI

/// View to display personal information about the owner.
struct OwnerProfileView: View {
    /// View model responsible to manage data from model layer
    @ObservedObject var viewModel = OwnerProfileViewModel()

    /// Owner information editing status
    @State private var isEditingMode = false

    var body: some View {
        NavigationView {
            VStack {
                if isEditingMode {
                    VStack {
                        EditOwnerInformationView(
                            name: $viewModel.name,
                            surname: $viewModel.surname,
                            phone: $viewModel.phone,
                            address: $viewModel.address
                        )

                        Button(AppButton.save.rawValue) {
                            viewModel.save()
                            isEditingMode.toggle()
                        }
                        .disabled(isEditingMode && viewModel.name.isEmpty)
                    }
                    .padding()
                    .buttonStyle(CapsuleWithWhiteText())
                    .background(Color.App.purpleLight)
                    .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
                } else {
                    VStack {
                        OwnerCardView(
                            name: viewModel.name,
                            surname: viewModel.surname,
                            phone: viewModel.phone,
                            address: viewModel.address,
                            avatarUrl: viewModel.avatarURL
                        )

                        Button(AppButton.edit.rawValue) {
                            isEditingMode.toggle()
                        }
                    }
                    .padding()
                    .buttonStyle(CapsuleWithWhiteText())
                    .background(Color.App.purpleLight)
                    .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
                }

                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(AppButton.logout.rawValue) {
                    viewModel.isAlertShown.toggle()
                }
            }
            .alert(AppAlert.logOut.rawValue, isPresented: $viewModel.isAlertShown) {
                Button(AppButton.continue.rawValue) {
                    viewModel.isLogoutConfirmed.toggle()
                    userRoleViewModel.resetCurrentRole()
                }
                Button(
                    AppButton.cancel.rawValue,
                    role: .cancel
                ) { viewModel.isAlertShown.toggle() }
            }
        }
    }

    // MARK: - Private interface

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel

    private let navigationTitle = "My profile"
}

struct OwnerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerProfileView()
    }
}
