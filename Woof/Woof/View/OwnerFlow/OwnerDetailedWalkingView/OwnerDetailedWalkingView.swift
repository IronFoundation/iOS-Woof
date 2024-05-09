import SwiftUI

/// A view displaying the detailed information about walking for owners.
struct OwnerDetailedWalkingView: View {
    /// Initialize `OwnerDetailedWalkingView` with the provided view model.
    ///
    /// - Parameter viewModel: the view model that provides and manages data for the view.
    init(viewModel: OwnerDetailedWalkingViewModel) {
        self.viewModel = viewModel
    }

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
                        labelTitle: timeLabelText,
                        text: viewModel.time,
                        imageName: .IconName.clock
                    )

                    InformationCellView(
                        labelTitle: dateLabelText,
                        text: viewModel.date,
                        imageName: .IconName.calendar
                    )

                    InformationCellView(
                        labelTitle: addressLabelText,
                        text: viewModel.address,
                        imageName: .IconName.house,
                        showedInOneLine: false
                    )

                    InformationCellView(
                        labelTitle: notesLabelText,
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

    private let viewModel: OwnerDetailedWalkingViewModel

    private let timeLabelText = "Time:"
    private let dateLabelText = "Date:"
    private let addressLabelText = "Detailed address:"
    private let notesLabelText = "Notes:"
}

#Preview {
    OwnerDetailedWalkingView(
        viewModel:
        OwnerDetailedWalkingViewModel(
            walking: Walking.Dummy.dummyWalking
        )
    )
}
