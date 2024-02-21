import UIKit

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
