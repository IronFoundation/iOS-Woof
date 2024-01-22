import SwiftUI

/// A view displaying information about the pet walkings.
struct SitterWalkingsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    NavigationLink(
                        destination: DetailWalkingView(
                            walkingStatus: "Booked",
                            day: "14",
                            month: "September"
                        )

                    ) {
                        SitterWalkingCardView(status: .booked, start: .now, end: .now + 2400)
                            .padding(.horizontal)
                    }
                    NavigationLink(
                        destination: DetailWalkingView(
                            walkingStatus: "Booked",
                            day: "14",
                            month: "September"
                        )

                    ) {
                        SitterWalkingCardView(status: .booked, start: .now + 2400, end: .now + 3600)
                            .padding(.horizontal)
                    }

                    NavigationLink(
                        destination: DetailWalkingView(
                            walkingStatus: "Finished",
                            day: "12",
                            month: "September"
                        )

                    ) {
                        SitterWalkingCardView(status: .finished, start: .now - 2400, end: .now - 1200)
                            .padding(.horizontal)
                    }
                }
            }

//            AddNewWalkingView()
        }
        .navigationTitle("Walkings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SitterWalkingsView_Previews: PreviewProvider {
    static var previews: some View {
        SitterWalkingsView()
    }
}
