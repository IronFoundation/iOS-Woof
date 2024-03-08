import SwiftUI

/// A view presents the information related to booking process.
struct BookingSlotView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: BookingSlotViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.wideSpacingSize) {
            HStack(spacing: AppStyle.UIElementConstant.wideSpacingSize) {
                SitterSectionInformationView(
                    fullName: viewModel.fullName,
                    rating: viewModel.rating,
                    phoneNumber: viewModel.phoneNumber,
                    city: viewModel.city
                ) { _ in }
                Spacer()
                WalkingSlotCardView(
                    price: viewModel.price,
                    startDate: viewModel.startDate,
                    endDate: viewModel.endDate
                )
                .frame(maxWidth: maxWidthOfWalkingSlotCardView)
                .font(
                    .system(
                        size: AppStyle.FontStyle.footnote.size
                    )
                )
            }

            Text(notesHeaderText)
                .italic()
                .foregroundColor(.App.grayDark)
            TextEditor(text: $viewModel.notes)
                .focused($isNotesFocused)
            Button(bookButtonText) {}
                .buttonStyle(PurpleCapsuleOfInfinityWidth())
        }
        .padding()
        .onAppear(perform: {
            isNotesFocused.toggle()
        })
        .background(Color.App.grayLight)
        .tint(Color.App.purpleDark)
        .navigationTitle(header)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Private interface

    @FocusState private var isNotesFocused: Bool

    private let notesHeaderText = "Enter useful notes about your dog or place:"
    private let bookButtonText = "Book now"
    private let header = "Book walking"
    private let maxWidthOfWalkingSlotCardView = 160.0
}

#Preview {
    BookingSlotView(viewModel: BookingSlotViewModel(walking: Walking.Dummy.dummyWalking))
}
