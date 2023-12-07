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

                        Button(saveButtonLabelText) {
                            viewModel.save()
                            isEditingMode.toggle()
                        }
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

                        Button(editButtonLabelText) {
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
            .disabled(isEditingMode && viewModel.name.isEmpty)
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(logoutButtonLabelText) {
                    viewModel.isAlertShown.toggle()
                }
            }
            .alert(alertLogOutTitle, isPresented: $viewModel.isAlertShown) {
                Button(continueButtonLabelText) {
                    viewModel.isLogoutConfirmed.toggle()
                    userRoleViewModel.resetCurrentRole()
                }
                Button(
                    cancelButtonLabelText,
                    role: .cancel
                ) { viewModel.isAlertShown.toggle() }
            }
        }
    }

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel

    private let alertLogOutTitle = "Do you really want to log out?"
    private let navigationTitle = "My profile"

    private let cancelButtonLabelText = "Cancel"
    private let continueButtonLabelText = "Continue"
    private let saveButtonLabelText = "Save"
    private let editButtonLabelText = "Edit"
    private let logoutButtonLabelText = "Logout"
}

struct OwnerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerProfileView()
    }
}
