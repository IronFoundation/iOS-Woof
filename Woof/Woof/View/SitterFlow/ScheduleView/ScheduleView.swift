import SwiftUI

/// A view displaying information about the sitter's schedule.
struct ScheduleView: View {
    @State private var selectedDay: String?
    @State private var selectedMonth: String?

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0..<4) { _ in
                        NavigationLink(
                            destination: DetailWalkingView(
                                walkingStatus: "Pending",
                                day: "12",
                                month: "September"
                            )
                            .onAppear {
                                selectedDay = "12"
                                selectedMonth = "September"
                            }
                        ) {
                            SitterWalkingCardView()
                                .padding(.horizontal)
                        }
                    }
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
