import SwiftUI

/// View to display personal information about the sitter.
struct SitterProfileView: View {
    // MARK: - Internal interface

    var body: some View {
        VStack {
            if viewModel.isEditingMode {
                VStack {
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
                            .padding(.vertical)
                            .font(.system(.footnote))
                    }

                    HStack {
                        Button(cancelButtonLabelText) {
                            viewModel.cancelEditing()
                        }

                        Spacer()

                        Button(saveButtonLabelText) {
                            Task {
                                await viewModel.save()
                            }
                        }
                        .disabled(viewModel.mandatoryFieldsAreEmpty)
                    }
                }
                .padding()
                .buttonStyle(CapsuleWithWhiteText())
                .background(Color.App.purpleLight)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)

            } else {
                VStack {
                    SitterInfoCardView(
                        name: viewModel.name,
                        surname: viewModel.surname,
                        phone: viewModel.phone,
                        bio: viewModel.bio,
                        ratePerHour: viewModel.pricePerHour,
                        city: viewModel.city
                    )

                    HStack {
                        Spacer()
                        Button(editButtonLabelText) {
                            viewModel.isEditingMode.toggle()
                        }
                        Spacer()
                        Button(logoutButtonLabelText) {
                            viewModel.isAlertShown.toggle()
                        }

                        .alert(alertLogOutTitle, isPresented: $viewModel.isAlertShown) {
                            Button(continueButtonLabelText) {
                                viewModel.isLogoutConfirmed.toggle()
                                userRoleViewModel.resetCurrentRole()
                                dismiss()
                            }
                            Button(
                                cancelButtonLabelText,
                                role: .cancel
                            ) { viewModel.isAlertShown.toggle() }
                        }
                        .background(
                            NavigationLink(
                                "",
                                destination: LoginView().navigationBarBackButtonHidden(true),
                                isActive: $viewModel.isLogoutConfirmed
                            )
                            .opacity(0)
                        )

                        Spacer()
                    }
                }
                .buttonStyle(CapsuleWithWhiteText())
                .padding()
                .background(Color.App.purpleLight)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
            }

            Spacer()
        }
        .padding(.horizontal)
        .overlay(
            Group {
                if viewModel.isSavingData {
                    Color.white.opacity(AppStyle.UIElementConstant.opacityLevelForProgressViewBackground)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        )
        .alert(
            alertTitle,
            isPresented: $viewModel.isErrorOccurred,
            actions: {
                Button(cancelButtonLabelText) {
                    viewModel.cancelEditing()
                }
                Button(tryAgainButtonLabelText) {
                    Task {
                        await viewModel.save()
                    }
                }
            },
            message: {
                Text(viewModel.errorMessage)
            }
        )
    }

    // MARK: - Private interface

    /// View model responsible to manage data from model layer.
    @StateObject private var viewModel = SitterProfileViewModel()

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel
    @Environment(\.dismiss) private var dismiss

    private let cancelButtonLabelText = "Cancel"
    private let saveButtonLabelText = "Save"
    private let editButtonLabelText = "Edit"
    private let tryAgainButtonLabelText = "Try Again"
    private let alertTitle = "Error"
    private let mandatoryPlaceholderText = "Fields with * are mandatory"
    private let logoutButtonLabelText = "Logout"
    private let continueButtonLabelText = "Continue"
    private let alertLogOutTitle = "Do you really want to log out?"
}

struct SitterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SitterProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")

        SitterProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")

        SitterProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
    }
}
