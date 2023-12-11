import SwiftUI

/// View to display personal information about the sitter.
struct SitterProfileView: View {
    // MARK: - Internal interface

    var body: some View {
        NavigationView {
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
                            Button(AppButton.cancel.description) {
                                viewModel.cancelEditing()
                            }

                            Spacer()

                            Button(AppButton.save.description) {
                                Task {
                                    await viewModel.save()
                                }
                            }
                            .disabled(viewModel.mandatoryFieldsAreEmpty)
                        }
                    }
                    .padding()
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

                        Button(AppButton.edit.description) {
                            viewModel.isEditingMode.toggle()
                        }
                    }
                    .padding()
                    .background(Color.App.purpleLight)
                    .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
                }

                Spacer()
            }
            .padding(.horizontal)
            .buttonStyle(CapsuleWithWhiteText())
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
                AppAlert.error.description,
                isPresented: $viewModel.isErrorOccurred,
                actions: {
                    Button(AppButton.cancel.description) {
                        viewModel.cancelEditing()
                    }
                    Button(AppButton.tryAgain.description) {
                        Task {
                            await viewModel.save()
                        }
                    }
                },
                message: {
                    Text(viewModel.errorMessage)
                }
            )
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(AppButton.logout.description) {
                    viewModel.isAlertShown.toggle()
                }
                .alert(AppAlert.logOut.description, isPresented: $viewModel.isAlertShown) {
                    Button(AppButton.continue.description) {
                        viewModel.isLogoutConfirmed.toggle()
                        userRoleViewModel.resetCurrentRole()
                    }
                    Button(
                        AppButton.cancel.description,
                        role: .cancel
                    ) { viewModel.isAlertShown.toggle() }
                }
            }
        }
    }

    // MARK: - Private interface

    /// View model responsible to manage data from model layer.
    @StateObject private var viewModel = SitterProfileViewModel()

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel

    private let navigationTitle = "My profile"
    private let mandatoryPlaceholderText = "Fields with * are mandatory"
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
