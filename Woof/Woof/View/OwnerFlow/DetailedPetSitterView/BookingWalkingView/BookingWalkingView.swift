import SwiftUI

struct BookingWalkingView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: BookingWalkingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.wideSpacingSize) {
            HStack(spacing: AppStyle.UIElementConstant.wideSpacingSize) {
                WalkingSlotGridView(
                    price: viewModel.price,
                    startDate: viewModel.start,
                    endDate: viewModel.end
                )
                .frame(maxWidth: 160)
                SitterInfoSectionView(
                    rating: viewModel.rating,
                    fullName: viewModel.fullName,
                    phoneNumber: viewModel.phoneNumber,
                    city: viewModel.city
                ) { text in
                    viewModel.copyToClipboardText(text)
                }
            }
            Text("Please fill out the information below:")
                .italic()
                .foregroundColor(.App.grayDark)

            OwnerBookingWalkingInfoView(
                address: $viewModel.address,
                notes: $viewModel.notes
            )
            .onAppear {
                viewModel.setOwnerInfo()
            }
            Button("Book now") {
                print("Confirm button tapped")
            }
            .disabled(viewModel.address.isEmpty)
            .buttonStyle(PurpleCapsuleOfInfinityWidth())

            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    BookingWalkingView(viewModel: BookingWalkingViewModel(walking: Walking.Dummy.dummyWalking))
}
