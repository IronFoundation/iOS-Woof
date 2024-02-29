import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel

    var body: some View {
        ScrollView {
            HStack {
                AvatarView(url: viewModel.imageURL)
                SitterSectionInformationView(
                    fullName: viewModel.fullName,
                    rating: viewModel.rating,
                    phoneNumber: viewModel.phoneNumber,
                    city: viewModel.city
                ) { text in
                    viewModel.copyToClipboardText(text)
                }
                Spacer()
                PriceLabel(price: viewModel.price)
            }
            Divider()
            Text(viewModel.bio)
                .font(.system(size: AppStyle.FontStyle.footnote.size))
            Divider().padding(.bottom)

            HStack {
                Text("Slots on ")
                Spacer()
                DatePicker("",
                           selection: $viewModel.selectedDate,
                           in: Date.now...,
                           displayedComponents: .date).labelsHidden()
                    .font(.system(size: AppStyle.FontStyle.heading.size))
                    .tint(Color.App.purpleDark)
                Spacer()
                Button("Search") {
                    Task {
                        await viewModel.fetchWalkings()
                    }
                }.buttonStyle(CapsuleWithWhiteText())

            }.padding()
            if viewModel.isLoading {
                ProgressView()
            } else {
                WalkingSlotsView(walkings: $viewModel.walkings)
            }
        }
        .padding()
        .background(Color.App.grayLight)
    }
}

struct DetailPetSitterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPetSitterView(
            viewModel: DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe)
        )
    }
}
