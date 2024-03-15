import SwiftUI

/// A view presents the information related to booking process.
struct BookingSlotView: View {
    /// Initializes the `BookingSlotView` with the given view model.
    ///
    /// - Parameter viewModel: The view model for this booking slot.
    init(viewModel: BookingSlotViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

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
            Button(bookButtonText) {
                Task {
                    await viewModel.bookWalking()
                }
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
        }
        .padding()
        .background(Color.App.grayLight)
        .tint(Color.App.purpleDark)
        .navigationTitle(header)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            isNotesFocused.toggle()
        })
    }

    // MARK: - Private interface

    @StateObject private var viewModel: BookingSlotViewModel
    @FocusState private var isNotesFocused: Bool

    private let notesHeaderText = "Enter useful notes about your dog or place:"
    private let bookButtonText = "Book now"
    private let header = "Book walking"
    private let maxWidthOfWalkingSlotCardView = 160.0
}

#Preview {
    BookingSlotView(
        viewModel: BookingSlotViewModel(walking: Walking.Dummy.dummyWalking)
    )
}
