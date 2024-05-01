import SwiftUI

/// A view displaying the detailed information about walking for owners.
struct OwnerDetailedWalkingView: View {
    /// View model responsible to manage data from model layer
    @ObservedObject var viewModel: OwnerDetailedWalkingViewModel

    var body: some View {
        VStack(spacing: AppStyle.UIElementConstant.wideSpacingSize) {
            HStack {
                AvatarView(url: viewModel.imageURL)

                VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                    Text(viewModel.fullName)
                        .bold()
                        .font(.system(size: AppStyle.FontStyle.heading.size))
                    FiveStarRatingView(stars: viewModel.rating)
                        .font(.system(size: AppStyle.FontStyle.footnote.size))
                    Label(viewModel.phoneNumber, systemImage: .IconName.phone)
                }

                Spacer()

                VStack(spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                    WalkingStatusLabel(status: viewModel.status)
                    Text(
                        viewModel.price,
                        format: .currency(code: "USD")
                    )
                    .bold()
                    .font(.system(size: AppStyle.FontStyle.heading.size))
                }
            }
            Text(header)
                .bold()
                .italic()
                .font(.system(size: AppStyle.FontStyle.heading.size))
            VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.minPadding) {
                HStack {
                    Label(timeLabel, systemImage: .IconName.clock)
                    Text(viewModel.time).bold()
                }
                Divider()
                HStack {
                    Label(dateLabel, systemImage: .IconName.calendar)
                    Text(viewModel.date).bold()
                }
                Divider()
                Label(addressLabel, systemImage: .IconName.house)
                Text(viewModel.address)
                    .bold()
                Divider()
                Label(notesLabel, systemImage: .IconName.notes)
                Text(viewModel.notes)
                    .bold()
            }.padding()
            .background(Color.App.grayLight)
                .clipShape(
                    RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius)
                )
            Spacer()
        }.padding()
        
    }

    // MARK: - Private interface

    private let header = "Walking details"
    private let timeLabel = "Time:"
    private let dateLabel = "Date:"
    private let addressLabel = "Detailed address:"
    private let notesLabel = "Notes:"
}

#Preview {
    OwnerDetailedWalkingView(
        viewModel:
        OwnerDetailedWalkingViewModel(
            walking: Walking.Dummy.dummyWalking
        )
    )
}
