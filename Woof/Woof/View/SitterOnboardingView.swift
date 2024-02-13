import SwiftUI

struct SitterOnboardingView: View {
    @StateObject private var sitterOnboardingViewModel = SitterOnboardingViewModel()

    @State var sitterPhoneNumber = ""
    @State var sitterName = ""

    var isSaveButtonEnabled: Bool {
        !sitterName.isEmpty && !sitterPhoneNumber.isEmpty
    }

    var body: some View {
        VStack {
            Text("""
            As a pet sitter, you can walk or look after other people's pets and earn some extra cash.
            To get started using the app, please enter your name and phone number.
            """)

            TextField("Name", text: $sitterName)

            TextField("Phone Number", text: $sitterPhoneNumber)

            Button("Start earn money!") {
                sitterOnboardingViewModel.name = sitterName
                sitterOnboardingViewModel.phone = sitterPhoneNumber

                sitterOnboardingViewModel.saveSitterDataLocally()

                userRoleViewModel.setSitterLoggedOnce()
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .disabled(!isSaveButtonEnabled)
            .background(isSaveButtonEnabled ? Color.App.purpleDark : Color.gray)
            .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
        }
        .padding()
        .foregroundColor(.App.purpleDark)
        .textFieldStyle(.roundedBorder)
        .background(Color.App.purpleLight)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
    }

    // MARK: - Private interface

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel
}

#Preview {
    SitterOnboardingView()
}
