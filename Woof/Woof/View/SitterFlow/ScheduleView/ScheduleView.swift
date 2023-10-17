import SwiftUI

/// A view displaying information about the sitter's schedule.
struct ScheduleView: View {
    var body: some View {
        NavigationView {
            Text("My schedule")
                .navigationTitle("My Schedule")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
