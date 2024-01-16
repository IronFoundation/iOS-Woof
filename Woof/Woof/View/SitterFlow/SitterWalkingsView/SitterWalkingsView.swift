import SwiftUI

/// A view displaying information about the pet walkings.
struct SitterWalkingsView: View {
    var body: some View {
        NavigationView {
            AddNewWalkingView()
        }
    }
}

struct SitterWalkingsView_Previews: PreviewProvider {
    static var previews: some View {
        SitterWalkingsView()
    }
}
