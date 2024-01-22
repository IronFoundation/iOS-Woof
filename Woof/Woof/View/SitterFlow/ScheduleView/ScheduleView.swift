import SwiftUI

/// A view displaying information about the sitter's schedule.
struct ScheduleView: View {
    @State private var selectedDay: String?
    @State private var selectedMonth: String?

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    NavigationLink(
                        destination: DetailWalkingView(
                            walkingStatus: "Available",
                            day: "12",
                            month: "September"
                        )
                    ) {
                        SitterWalkingCardView(status: .available, start: .now, end: .now + 1200)
                            .padding(.horizontal)
                    }
                    NavigationLink(
                        destination: DetailWalkingView(
                            walkingStatus: "Available",
                            day: "12",
                            month: "September"
                        )
                    ) {
                        SitterWalkingCardView(status: .pending, start: .now, end: .now + 1200)
                            .padding(.horizontal)
                    }
                    NavigationLink(
                        destination: DetailWalkingView(
                            walkingStatus: "Available",
                            day: "12",
                            month: "September"
                        )
                    ) {
                        SitterWalkingCardView(status: .canceledBySitter, start: .now, end: .now + 1200)
                            .padding(.horizontal)
                    }
                    NavigationLink(
                        destination: DetailWalkingView(
                            walkingStatus: "Available",
                            day: "12",
                            month: "September"
                        )
                    ) {
                        SitterWalkingCardView(status: .expired, start: .now, end: .now + 1200)
                            .padding(.horizontal)
                    }
                }
            }
            .toolbar {
                NavigationLink("Add") {
                    AddNewWalkingView()
                }
            }
            .navigationTitle(selectedTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Private interface

    private let scheduleTitle = "Walking schedule"
    private let navigationTitle = "My Schedule"
    private var selectedTitle: String {
        if let day = selectedDay, let month = selectedMonth {
            return "\(month) \(day)"
        } else {
            return "Walking Schedule"
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
