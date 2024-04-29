import SwiftUI

struct CustomCalendarDayCell: View {
    /// Date represented by the cell.
    let date: Date
    /// Indicates whether the date is selected.
    let isSelected: Bool

    var body: some View {
        Text("\(Calendar.current.component(.day, from: date))")
            .frame(width: cellSize, height: cellSize)
            .background(isSelected ? Color.App.purpleLight : Color.clear)
            .clipShape(Circle())
    }

    // MARK: - Private interface

    private let cellSize: CGFloat = 40
}

#Preview {
    HStack {
        CustomCalendarDayCell(date: Date(), isSelected: true)
        CustomCalendarDayCell(date: Date(), isSelected: false)
    }
}
