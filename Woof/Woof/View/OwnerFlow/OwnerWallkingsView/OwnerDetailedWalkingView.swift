import SwiftUI

struct OwnerDetailedWalkingView: View {
    let walking: Walking

    var body: some View {
        Text(walking.id.uuidString)
    }
}

#Preview {
    OwnerDetailedWalkingView(walking: Walking.Dummy.dummyWalking)
}
