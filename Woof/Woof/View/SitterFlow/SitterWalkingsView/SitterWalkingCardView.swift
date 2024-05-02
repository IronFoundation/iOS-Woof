import SwiftUI

/// A view representing a card displaying details of a walking.
struct SitterWalkingCardView: View {
    /// The walking information to display
    let walking: Walking

    var body: some View {
        VStack {
            HStack {
                VStack(
                    alignment: .leading,
                    spacing: AppStyle.UIElementConstant.spacingBetweenElements
                ) {
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
                    Text(
                        walking.start,
                        style: .date
                    )
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
                    Text(walking.owner?.name ?? "")
                        .bold()
                    Group {
                        Text(walking.owner?.city ?? "")
                        Text(walking.owner?.address ?? "")
                    }
                    .font(
                        .system(
                            size: AppStyle.FontStyle.footnote.size
                        )
                    )
                }
            }
        }
        .padding()
        .background(Color.App.grayLight)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppStyle.UIElementConstant.cornerRadius
            )
        )
    }
}

#Preview {
    SitterWalkingCardView(walking: Walking.Dummy.dummyWalking)
}
