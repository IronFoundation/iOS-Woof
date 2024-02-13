import SwiftUI

struct OwnerOnboardingView: View {
    @StateObject private var ownerOnboardingViewModel = OwnerOnboardingViewModel()

    @State var ownerPhoneNumber = ""
    @State var ownerName = ""

    var isSaveButtonEnabled: Bool {
        !ownerName.isEmpty && !ownerPhoneNumber.isEmpty
    }

    var body: some View {
        VStack {
            Text("""
            As a pet owner, you can find a sitter who will take your furry friend for a walk.
            To get started, please enter your name and phone number.
            """)

            TextField("Name", text: $ownerName)

            TextField("Phone Number", text: $ownerPhoneNumber)
                .keyboardType(.phonePad)

            Button("Find your pet sitter") {
                ownerOnboardingViewModel.name = ownerName
                ownerOnboardingViewModel.phone = ownerPhoneNumber

                ownerOnboardingViewModel.saveOwnerData()

                userRoleViewModel.setOwnerLoggedOnce()
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
    OwnerOnboardingView()
}
