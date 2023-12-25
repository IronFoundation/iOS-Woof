import SwiftUI

/* A view representing the main tab view for the owner.

 This view displays a tab bar with different tabs for managing pet sitters, walkings, and owner profile information.
 */
struct OwnerMainTabView: View {
    // MARK: - Internal interface

    init() {
        customizeTabBar()
    }

    var body: some View {
        TabView {
            SitterListView()
                .tabItem {
                    Label(sittersLabel, systemImage: .IconName.findSitterTab)
                }

            OwnerWalkingsView()
                .tabItem {
                    Label(walkingsLabel, systemImage: .IconName.walkingsTab)
                }

            OwnerProfileView()
                .tabItem {
                    Label(profileLabel, systemImage: .IconName.profileTab)
                }
        }
        .tint(Color.App.purpleDark)
    }

    // MARK: - Private interface

    @StateObject private var viewModel = OwnerMainTabViewModel()

    private let sittersLabel = "Sitters"
    private let walkingsLabel = "Walkings"
    private let profileLabel = "Profile"

    /**
     Customises the appearance of the tab bar.
     */
    private func customizeTabBar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.unselectedItemTintColor = UIColor(Color.App.grayDark)
    }
}

struct OwnerMainTabView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerMainTabView()
    }
}
