import SwiftUI

// struct ExtendableText: View {
//    let lineLimit: Int
//    let text: String
//    @Binding var showMore: Bool
//
//    var body: some View {
//        VStack {
//            Text(text)
//                .lineLimit(showMore ? nil : lineLimit)
//            HStack {
//                Spacer()
//                Button(showMore ? "Hide" : "Show more") {
//                    showMore.toggle()
//                }.foregroundColor(.App.purpleDark)
//                    .font(.system(size: AppStyle.FontStyle.footnote.size))
//            }
//        }
//    }
// }

struct ExtendableText: View {
    let lineLimit: Int
    let text: String
    @Binding var showMore: Bool

    var body: some View {
        VStack {
            Text(text)
                .lineLimit(showMore ? nil : lineLimit)
            if text.numberOfLines(using: lineLimit) > lineLimit {
                HStack {
                    Spacer()
                    Button(showMore ? "Hide" : "Show more") {
                        showMore.toggle()
                    }.foregroundColor(.purple)
                        .font(.system(size: AppStyle.FontStyle.footnote.size))
                }
            } else {
                Spacer()
            }
        }
    }
}

extension String {
    func numberOfLines(using _: Int) -> Int {
        let font = UIFont.systemFont(ofSize: 12)
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
