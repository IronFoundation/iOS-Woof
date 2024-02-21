import SwiftUI

struct ExpandableText: View {
    let lineLimit: Int
    let text: String
    let fontSize: CGFloat
    @Binding var showMore: Bool

    var body: some View {
        VStack {
            Text(text)
                .lineLimit(showMore ? nil : lineLimit)

            if text.numberOfLines(using: lineLimit, for: fontSize) > lineLimit {
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
}

#Preview {
    ExpandableText(
        lineLimit: 1,
        text: "Some random text for tests",
        fontSize: 20,
        showMore: .constant(false)
    )
}
