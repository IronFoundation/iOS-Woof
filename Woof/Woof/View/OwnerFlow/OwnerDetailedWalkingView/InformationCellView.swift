import SwiftUI

/// Represents an information cell with provided label, text, and icon.
/// Can be displayed in one line or presents `text` under the `icon` and `label`.
struct InformationCellView: View {
    /** Initializes an information cell view with provided parameters.

     - Parameters:
     - label: The label text for the information.
     - text: The text to display in the cell.
     - imageName: The name of the system image to display.
     - showedInOneLine: Indicates whether the information should be presented in one line or not, by default is `true`.
      */
    init(label: String, text: String, imageName: String, showedInOneLine: Bool = true) {
        self.label = label
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
                        label,
                        systemImage: imageName
                    )
                    Text(text)
                        .bold()
                }
            } else {
                Label(
                    label,
                    systemImage: imageName
                )
                Text(text)
                    .bold()
            }

            Divider()
        }
    }

    // MARK: - Private interface

    let label: String
    let text: String
    let imageName: String
    let showedInOneLine: Bool
}

#Preview {
    VStack {
        InformationCellView(
            label: "Address:",
            text: "City, Some str. 23-27",
            imageName: .IconName.house,
            showedInOneLine: true
        )
        InformationCellView(
            label: "Address:",
            text: "City, Some str. 23-27",
            imageName: .IconName.house,
            showedInOneLine: false
        )
    }
}
