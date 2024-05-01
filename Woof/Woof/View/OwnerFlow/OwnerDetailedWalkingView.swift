import SwiftUI

struct OwnerDetailedWalkingView: View {
    @ObservedObject var viewModel: OwnerDetailedWalkingViewModel

    var body: some View {
        VStack(spacing: AppStyle.UIElementConstant.wideSpacingSize) {
            HStack {
                HStack {
                    AvatarView(url: viewModel.imageURL)
                    VStack(alignment: .leading) {
                        Text(viewModel.fullName)
                            .bold()
                            .font(.system(size: AppStyle.FontStyle.heading.size))
                        Label(viewModel.phoneNumber, systemImage: .IconName.phone)
                    }
                }
                Spacer()
                VStack {
                    WalkingStatusLabel(status: viewModel.status)
                    Text(
                        viewModel.price,
                        format: .currency(code: "USD")
                    )
                    .bold()
                }.padding()
            }
            Text(header)
                .bold()
                .font(.system(size: AppStyle.FontStyle.heading.size))
                .foregroundColor(.App.purpleDark)
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
            }
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
