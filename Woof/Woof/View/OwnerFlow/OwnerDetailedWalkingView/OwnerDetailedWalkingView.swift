import SwiftUI

/// A view displaying the detailed information about walking for owners.
struct OwnerDetailedWalkingView: View {
    /// View model responsible to manage data from model layer
    let viewModel: OwnerDetailedWalkingViewModel

    var body: some View {
        VStack {
            VStack {
                HStack {
                    AvatarView(url: viewModel.imageURL)

                    VStack(
                        alignment: .leading,
                        spacing: AppStyle.UIElementConstant.spacingBetweenElements
                    ) {
                        Text(viewModel.fullName)
                            .bold()
                            .font(
                                .system(
                                    size: AppStyle.FontStyle.heading.size
                                )
                            )
                        FiveStarRatingView(stars: viewModel.rating)
                        Label(
                            viewModel.phoneNumber,
                            systemImage: .IconName.phone
                        )
                    }

                    Spacer()

                    VStack(spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                        Text(
                            viewModel.price,
                            format: .currency(code: "USD")
                        )
                        .bold()
                        WalkingStatusLabel(status: viewModel.status)
                    }
                    .font(
                        .system(
                            size: AppStyle.FontStyle.heading.size
                        )
                    )
                }

                Divider()

                VStack(
                    alignment: .leading,
                    spacing: AppStyle.UIElementConstant.minPadding
                ) {
                    InformationCellView(
                        label: timeLabel,
                        text: viewModel.time,
                        imageName: .IconName.clock
                    )

                    InformationCellView(
                        label: dateLabel,
                        text: viewModel.date,
                        imageName: .IconName.calendar
                    )

                    InformationCellView(
                        label: addressLabel,
                        text: viewModel.address,
                        imageName: .IconName.house,
                        showedInOneLine: false
                    )

                    InformationCellView(
                        label: notesLabel,
                        text: viewModel.notes,
                        imageName: .IconName.notes,
                        showedInOneLine: false
                    )
                }
            }
            .padding()
            .font(
                .system(
                    size: AppStyle.FontStyle.footnote.size
                )
            )
            .background(Color.App.grayLight)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: AppStyle.UIElementConstant.cornerRadius
                )
            )
            Spacer()
        }
        .padding()
    }

    // MARK: - Private interface

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
