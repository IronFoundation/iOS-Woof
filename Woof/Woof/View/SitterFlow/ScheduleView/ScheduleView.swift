import SwiftUI

/// A view displaying information about the sitter's schedule.
struct ScheduleView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0..<4) { _ in
                        NavigationLink(destination: DetailWalkingView(walkingStatus: "Pending")) {
                            SitterWalkingCardView()
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Walking Schedule")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Private interface

    private let scheduleTitle = "Walking schedule"
    private let navigationTitle = "My Schedule"
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
