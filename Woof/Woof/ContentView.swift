import SwiftUI

struct ContentView: View {
    @StateObject var userRoleVM = UserRoleViewModel()

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

#Preview {
    ContentView()
}
