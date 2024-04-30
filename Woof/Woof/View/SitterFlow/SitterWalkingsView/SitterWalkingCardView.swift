import SwiftUI

/// A view representing a card displaying details of a walking.
struct SitterWalkingCardView: View {
    /// Contains the information about the walking.
    let walking: Walking

    var body: some View {
        VStack {
            HStack {
                VStack(spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                    HStack {
                        Text(walking.start, style: .time)
                        Text("-")
                        Text(walking.end, style: .time)
                    }
                    .font(
                        .system(
                            size: AppStyle.FontStyle.body.size,
                            weight: .bold
                        )
                    )
                    Text(walking.start, style: .date)
                        .italic()
                        .font(
                            .system(
                                size: AppStyle.FontStyle.footnote.size,
                                weight: .bold
                            )
                        )
                    WalkingStatusLabel(status: walking.status)
                }
                .foregroundColor(.App.grayDark)

                Spacer()
                VStack(
                    alignment: .trailing,
                    spacing: AppStyle.UIElementConstant.spacingBetweenElements
                ) {
                    Text(ownerName)
                        .bold()
                    Group {
                        Text(ownerCity)
                        Text(ownerAddress)
                    }
                    .font(.system(size: AppStyle.FontStyle.footnote.size))
                }
            }
        }
        .padding()
        .background(Color.App.grayLight)
        .clipShape(
            RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius)
        )
    }

    // MARK: - Private interface

    private var ownerName: String {
        walking.owner?.name ?? "not available"
    }

    private var ownerCity: String {
        walking.owner?.city ?? ""
    }

    private var ownerAddress: String {
        walking.owner?.address ?? ""
    }
}

#Preview {
    SitterWalkingCardView(walking: Walking.Dummy.dummyWalking)
}
