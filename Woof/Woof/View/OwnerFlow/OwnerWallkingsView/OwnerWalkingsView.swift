import SwiftUI

/// A view displaying information about the pet walkings.
struct OwnerWalkingsView: View {
    var body: some View {
        NavigationView {
            Text("Walkings stub")
                .navigationTitle("Walkings")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct OwnerWalkingsView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerWalkingsView()
    }
}
