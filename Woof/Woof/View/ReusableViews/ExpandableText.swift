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

            if text.numberOfLines(using: lineLimit, for: fontSize) >= lineLimit {
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

extension String {
    func numberOfLines(using _: Int, for fontSize: CGFloat) -> Int {
        let font = UIFont.systemFont(ofSize: fontSize)
        let textSize = (self as NSString).boundingRect(
            with: CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        )
        let numberOfLines = Int(ceil(CGFloat(textSize.height) / font.lineHeight))
        return numberOfLines
    }
}

// swiftlint:disable line_length
#Preview {
    VStack {
        ExpandableText(
            lineLimit: 3,
            text: "Ich gehe gerne mit Hunden spazieren und habe Erfahrung im Training großer und gefährlicher Tiere. Ich gehe gerne mit Hunden spazieren und habe Erfahrung im Training großer und gefährlicher Tiere.",
            fontSize: 12,
            showMore: .constant(true)
        )
        ExpandableText(
            lineLimit: 3,
            text: "Ich gehe gerne mit Hunden spazieren und habe Erfahrung im Training großer und gefährlicher Tiere. Ich gehe gerne mit Hunden spazieren und habe Erfahrung im Training großer und gefährlicher Tiere.",
            fontSize: 12,
            showMore: .constant(false)
        )
    }
}
