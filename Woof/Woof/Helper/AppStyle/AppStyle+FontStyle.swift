import SwiftUI

extension AppStyle {
    /// Provides the font style using within the application.
    enum FontStyle {
        /// Font style using for titles and headings.
        case heading
        /// Font style using as default font size.
        case body
        /// Font style using for additional elements.
        case footnote

        /// The font size setting for font style.
        var size: CGFloat {
            switch self {
            case .heading:
                return 20.0
            case .body:
                return 16.0
            case .footnote:
                return 12.0
            }
        }
    }
}
