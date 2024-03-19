import SwiftUI

struct OwnerWalkingCardView: View {
    let walking: Walking

    var body: some View {
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
            }.foregroundColor(.App.grayDark)

            Spacer()
            VStack(spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                Text(walking.sitter.name)
                    .bold()

                WalkingStatusLabel(status: walking.status)
            }

        }.padding()
            .background(Color.App.grayLight)
            .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
    }
}

#Preview {
    OwnerWalkingCardView(walking: Walking.Dummy.dummyWalking)
}
