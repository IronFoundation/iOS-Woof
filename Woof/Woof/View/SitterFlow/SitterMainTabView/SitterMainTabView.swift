import SwiftUI

/// A view representing the main tab view for the sitter.
struct SitterMainTabView: View {
    // MARK: - Internal interface

    init() {
        customizeTabBar()
    }

    var body: some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Label(scheduleLabel, systemImage: .IconName.scheduleTab)
                }

            SitterWalkingsView()
                .tabItem {
                    Label(walkingsLabel, systemImage: .IconName.walkingsTab)
                }

            SitterProfileView()
                .tabItem {
                    Label(profileLabel, systemImage: .IconName.profileTab)
                }
        }
        .tint(Color.App.purpleDark)
        .foregroundColor(.App.purpleDark)
    }

    // MARK: - Private interface

    @StateObject private var viewModel = SitterMainTabViewModel()

    private let scheduleLabel = "Schedule"
    private let walkingsLabel = "Walkings"
    private let profileLabel = "Profile"

    private func customizeTabBar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.unselectedItemTintColor = UIColor(Color.App.grayDark)
    }
}

struct SitterMainTabview_Previews: PreviewProvider {
    static var previews: some View {
        SitterMainTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
        SitterMainTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        SitterMainTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
    }
}
