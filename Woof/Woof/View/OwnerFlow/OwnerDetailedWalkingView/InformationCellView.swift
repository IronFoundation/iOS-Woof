import SwiftUI

/// Represents an information cell with provided label, text, and icon.
/// Can be displayed in one line or presents `text` under the `icon` and `label`.
struct InformationCellView: View {
    /** Initializes an information cell view with provided parameters.

     - Parameters:
     - labelTitle: The label text for the information.
     - text: The text to display in the cell.
     - imageName: The name of the system image to display.
     - showedInOneLine: Indicates whether the information should be presented in one line or not, by default is `true`.
      */
    init(
        labelTitle: String,
        text: String,
        imageName: String,
        showedInOneLine: Bool = true
    ) {
        self.labelTitle = labelTitle
        self.text = text
        self.imageName = imageName
        self.showedInOneLine = showedInOneLine
    }

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: AppStyle.UIElementConstant.minPadding
        ) {
            if showedInOneLine {
                HStack {
                    Label(
                        labelTitle,
                        systemImage: imageName
                    )
                    Text(text)
                        .bold()
                }
            } else {
                Label(
                    labelTitle,
                    systemImage: imageName
                )
                Text(text)
                    .bold()
            }

            Divider()
        }
    }

    // MARK: - Private interface

    private let labelTitle: String
    private let text: String
    private let imageName: String
    private let showedInOneLine: Bool
}

#Preview {
    VStack {
        InformationCellView(
            labelTitle: "Address:",
            text: "City, Some str. 23-27",
            imageName: .IconName.house,
            showedInOneLine: true
        )
        InformationCellView(
            labelTitle: "Address:",
            text: "City, Some str. 23-27",
            imageName: .IconName.house,
            showedInOneLine: false
        )
    }
}
