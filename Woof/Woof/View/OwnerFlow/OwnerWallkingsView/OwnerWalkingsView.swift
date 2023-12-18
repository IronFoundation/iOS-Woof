import SwiftUI

/// A view displaying information about the pet walkings.
struct OwnerWalkingsView: View {
    var body: some View {
        NavigationView {
            Text(walkingsStubTitle)
                .navigationTitle(navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Private interface

    private let walkingsStubTitle = "Walkings stub"
    private let navigationTitle = "Walkings"
}

struct OwnerWalkingsView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerWalkingsView()
    }
}
