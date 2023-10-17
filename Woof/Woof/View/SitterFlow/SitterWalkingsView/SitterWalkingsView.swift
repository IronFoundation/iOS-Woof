import SwiftUI

/// A view displaying information about the pet walkings.
struct SitterWalkingsView: View {
    var body: some View {
        NavigationView {
            Text("Walkings stub")
                .navigationTitle("Walkings")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SitterWalkingsView_Previews: PreviewProvider {
    static var previews: some View {
        SitterWalkingsView()
    }
}
