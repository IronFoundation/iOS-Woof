import SwiftUI

/// A view displaying information about the sitter's schedule.
struct ScheduleView: View {
    var body: some View {
        NavigationView {
            Text(scheduleTitle)
                .navigationTitle(navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(navigationLinkTitle) {
                            CreateNewWalkingView()
                        }
                    }
                }
        }
    }

    // MARK: - Private interface

    private let scheduleTitle = "Walking schedule"
    private let navigationTitle = "My Schedule"
    private let navigationLinkTitle = "add walking"
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
