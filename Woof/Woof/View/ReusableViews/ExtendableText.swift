import SwiftUI

struct ExtendableText: View {
    let lineLimit: Int
    let text: String
    @Binding var showMore: Bool

    var body: some View {
        VStack {
            Text(text)
                .lineLimit(showMore ? nil : lineLimit)
            HStack {
                Spacer()
                Button(showMore ? "Hide" : "Show more") {
                    showMore.toggle()
                }.foregroundColor(.App.purpleDark)
                    .font(.system(size: AppStyle.FontStyle.footnote.size))
            }
        }
    }
}

#Preview {
    VStack {
        ExtendableText(
            lineLimit: 3,
            text: "Modern Generic Programming - associatedtype",
            showMore: .constant(true)
        )
        ExtendableText(
            lineLimit: 3,
            text: "Modern Generic Programming - associatedtype",
            showMore: .constant(false)
        )
    }
}
