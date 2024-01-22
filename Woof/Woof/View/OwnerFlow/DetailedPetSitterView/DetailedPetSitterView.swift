import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel

    var body: some View {
        ScrollView {
            // extract to separate view
            HStack {
                VStack {
                    AvatarView(url: viewModel.imageURL)
                    FiveStarRatingView(stars: viewModel.rating)
                }
                VStack {
                    TextWithIconLabelView(
                        iconName: .IconName.filledPerson,
                        text: viewModel.fullName
                    )
                    .contextMenu {
                        Button {
                            viewModel.copyToClipboardText(viewModel.fullName)
                        } label: {
                            CopyToClipboardLabel()
                        }
                    }

                    TextWithIconLabelView(
                        iconName: .IconName.phone,
                        text: viewModel.phoneNumber
                    )
                    .contextMenu {
                        Button {
                            viewModel.copyToClipboardText(viewModel.phoneNumber)
                        } label: {
                            CopyToClipboardLabel()
                        }
                    }

                    TextWithIconLabelView(
                        iconName: .IconName.house,
                        text: viewModel.city
                    )
                }
            }
            .padding()
            VStack {
                Text(viewModel.bio)
                    .lineLimit(showMore ? nil : 2)
                Button(showMore ? "Hide" : "Show more") {
                    showMore.toggle()
                }
            }

            Spacer()
            Text("Available slots:")
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
                .bold()
                .foregroundColor(.App.purpleDark)

            ForEach(Walking.Dummy.bulkDummyWalkings) { walking in
                NavigationLink {
                    BookingWalkingView(walking: walking)
                } label: {
//                    WalkingSlotCardView(
//                        price: walking.price,
//                        startDate: walking.start,
//                        endDate: walking.end
//                    )
                    WalkingSlotOneLineView(
                        price: walking.price,
                        startDate: walking.start,
                        endDate: walking.end
                    )
                }
            }.listStyle(.plain)
        }.navigationTitle(viewModel.fullName)
            .navigationBarTitleDisplayMode(.inline)

            .padding()
            .background(Color.App.grayLight)
    }

    @State var showMore = false
}

#Preview {
    NavigationView {
        DetailPetSitterView(viewModel: DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe))
    }
}
