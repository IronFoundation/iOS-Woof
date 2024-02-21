import SwiftUI

/// A view that onboards the owner and also collects mandatory information about them.
struct OwnerOnboardingView: View {
    /// The name of the owner.
    @Binding var name: String

    /// The surname of the owner.
    @Binding var surname: String

    /// The phone of the owner.
    @Binding var phone: String

    /// The owner's city.
    @Binding var city: String

    /// The address of the owner street and building
    @Binding var address: String

    /// A boolean indicating whether the save button should be enabled.
    var isSaveButtonEnabled: Bool {
        !name.isEmpty && !phone.isEmpty && !city.isEmpty && !address.isEmpty
    }

    var body: some View {
        VStack {
            Text(welcomeText)
                .foregroundColor(Color.App.purpleDark)

            Text(onboardingText)
                .lineLimit(lineLimitForOwnerOnboarding)
                .foregroundColor(Color.App.purpleDark)

            EditOwnerInformationView(
                name: $name,
                surname: $surname,
                phone: $phone,
                city: $city,
                address: $address
            )

            Button(proceedButtonTitle) {}
                .padding()
                .clipShape(Capsule())
                .disabled(!isSaveButtonEnabled)
                .background(isSaveButtonEnabled ? Color.App.purpleDark : Color.gray)
                .foregroundColor(Color.App.white)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
        }
    }

    // MARK: - Private interface

    private let proceedButtonTitle = "Find your pet sitter"
    private let welcomeText = "Hello!"
    private let lineLimitForOwnerOnboarding = 4
    private let onboardingText = """
    We're almost ready to help you find a suitable pet-sitter for your beloved companion.
    Just specify a few details by entering your information:
    """
}

#Preview {
    VStack {
        OwnerOnboardingView(
            name: .constant(""),
            surname: .constant(""),
            phone: .constant(""),
            city: .constant(""),
            address: .constant("")
        )
    }
}
