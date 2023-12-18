import SwiftUI

/// A root view for the app.
struct ContentView: View {
    @StateObject private var userRoleVM = UserRoleViewModel()

    var body: some View {
        switch userRoleVM.userRole {
        case .owner:
            OwnerMainTabView()
                .environmentObject(userRoleVM)
        case .sitter:
            SitterMainTabView()
                .environmentObject(userRoleVM)
        case .none:
            LoginView()
                .environmentObject(userRoleVM)
        }
    }
}
