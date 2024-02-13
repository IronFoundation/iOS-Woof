import SwiftUI

/// A root view for the app.
struct ContentView: View {
    @StateObject private var userRoleVM = UserRoleViewModel()

    var body: some View {
        switch userRoleVM.userRole {
        case .owner:
            if userRoleVM.ownerLoggedOnce {
                OwnerMainTabView()
                    .environmentObject(userRoleVM)
            } else {
                OwnerOnboardingView()
                    .environmentObject(userRoleVM)
            }
        case .sitter:
            if userRoleVM.sitterLoggedOnce {
                SitterMainTabView()
                    .environmentObject(userRoleVM)
            } else {
                SitterOnboardingView()
                    .environmentObject(userRoleVM)
            }
        case .none:
            LoginView()
                .environmentObject(userRoleVM)
        }
    }
}
