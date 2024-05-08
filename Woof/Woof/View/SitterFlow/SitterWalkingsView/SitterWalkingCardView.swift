import SwiftUI

/// A view representing a card displaying details of a walking.
struct SitterWalkingCardView: View {
    /// The view model responsible for data preparation.
    let viewModel: SitterWalkingCardViewModel

    var body: some View {
        VStack {
            HStack {
                VStack(
                    alignment: .leading,
                    spacing: AppStyle.UIElementConstant.spacingBetweenElements
                ) {
                    Text(viewModel.time)
                        .font(
                            .system(
                                size: AppStyle.FontStyle.body.size,
                                weight: .bold
                            )
                        )
                    Text(viewModel.date)
                        .italic()
                        .font(
                            .system(
                                size: AppStyle.FontStyle.footnote.size,
                                weight: .bold
                            )
                        )
                    WalkingStatusLabel(status: viewModel.status)
                }
                .foregroundColor(.App.grayDark)

                Spacer()

                VStack(
                    alignment: .trailing,
                    spacing: AppStyle.UIElementConstant.spacingBetweenElements
                ) {
                    Text(viewModel.fullName)
                        .bold()
                    Group {
                        Text(viewModel.city)
                        Text(viewModel.address)
                    }
                    .font(
                        .system(
                            size: AppStyle.FontStyle.footnote.size
                        )
                    )
                }
            }.foregroundColor(.App.purpleDark)
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
    SitterWalkingCardView(
        viewModel: SitterWalkingCardViewModel(
            walking: Walking.Dummy.dummyWalking
        )
    )
}
