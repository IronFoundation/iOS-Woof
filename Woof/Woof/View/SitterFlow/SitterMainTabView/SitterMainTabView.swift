import SwiftUI

/// A view representing the main tab view for the sitter.
struct SitterMainTabView: View {
    // MARK: - Internal interface

    init() {
        customizeTabBar()
    }

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Group {
                    Text("My schedule")
                        .tabItem {
                            Label("Schedule", systemImage: .IconName.scheduleTab)
                        }
                        .tag(Tab.schedule)

                    Text("Walkings")
                        .tabItem {
                            Label("Walkings", systemImage: .IconName.walkingsTab)
                        }
                        .tag(Tab.walkings)

                    SitterProfileView()
                        .tabItem {
                            Label("Profile", systemImage: .IconName.profileTab)
                        }
                        .tag(Tab.profile)
                }
            }
            .tint(Color.App.purpleDark)
            .navigationTitle(selection.header)
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.App.purpleDark)
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = SitterMainTabViewModel()
    @State private var selection: Tab = .schedule

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
