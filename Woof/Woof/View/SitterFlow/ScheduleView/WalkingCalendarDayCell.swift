import SwiftUI

struct WalkingCalendarDayCell: View {
    let date: Date
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Text("\(Calendar.current.component(.day, from: date))")
            .frame(width: cellSize, height: cellSize)
            .background(isSelected ? Color.App.purpleLight : Color.clear)
            .clipShape(Circle())
            .onTapGesture {
                onTap()
            }
    }

    // MARK: - Private interface

    private let cellSize: CGFloat = 40
}

#Preview {
    WalkingCalendarDayCell(date: Date(), isSelected: true, onTap: {})
}
