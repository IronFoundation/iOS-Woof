import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel

    var body: some View {
        ScrollView {
            HStack {
                AvatarView(url: viewModel.imageURL)
                SitterFullInformationView(
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
            Divider()
            Spacer()
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
