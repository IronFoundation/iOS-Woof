import SwiftUI

struct SitterOnboardingView: View {
    var body: some View {
        Text(onboardingText)
            .foregroundColor(Color.App.purpleDark)
    }

    // MARK: - Private interface

    private let onboardingText = """
    We're excited to have you on board as a pet sitter!
    To get started on your journey of creating delightful experiences for our furry friends, please take a moment to fill in some essential details about yourself.
    Your dedication and care will make a world of difference to pets in need. Let's begin by entering your information:
    """
}

#Preview {
    SitterOnboardingView()
}
