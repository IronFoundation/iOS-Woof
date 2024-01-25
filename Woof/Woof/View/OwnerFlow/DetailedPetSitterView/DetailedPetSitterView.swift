import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel

    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                AvatarView(url: viewModel.imageURL)
                SitterInfoSectionView(
                    rating: viewModel.rating,
                    fullName: viewModel.fullName,
                    phoneNumber: viewModel.phoneNumber,
                    city: viewModel.city
                ) { text in
                    viewModel.copyToClipboardText(text)
                }
            }
            Divider()
            VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                ExtendableText(
                    lineLimit: 2,
                    text: viewModel.bio,
                    showMore: $showMore
                )
                .font(.system(size: AppStyle.FontStyle.footnote.size))
                .padding(.horizontal)
                .padding(.top)
            }

            Divider()
            WalkingSlotsSection(walkings: viewModel.walkings)
                // find a solution to send request when needed instead of on appear
//                .onReceive(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Publisher@*/NotificationCenter.default.publisher(for: .NSCalendarDayChanged)/*@END_MENU_TOKEN@*/, perform: { _ in
//                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=code@*/ /*@END_MENU_TOKEN@*/
//                })
                .onAppear(perform: {
                    Task {
                        await viewModel.fetchWalkings()
                    }
                })
        }
        .padding(.horizontal)
        .background(Color.App.grayLight)
    }

    @State private var showMore = false
}

#Preview {
    NavigationView {
        DetailPetSitterView(viewModel: DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe))
    }
}
