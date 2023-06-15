import SwiftUI

/// A view that displays a text input field with a prompt text message for a user.
struct TextEditorWithPlaceholder: View {
    /// The text to be shown in the text input field.
    @Binding var message: String

    /// The text that is shown in the text input field when it’s empty.
    let placeholder: LocalizedStringKey

    var body: some View {
        ZStack(alignment: .topLeading) {
            if message.isEmpty {
                Text(placeholder)
                    .padding(AppStyle.UIElementConstant.spacingBetweenElements)
                    .foregroundColor(Color.gray)
            }
            TextEditor(text: $message)
                .opacity(message.isEmpty ? 0.25 : 1)
        }
    }
}

struct TextEditorWithPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorWithPlaceholder(message: .constant(""), placeholder: "Your Message")
    }
}
