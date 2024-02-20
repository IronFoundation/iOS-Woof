import SwiftUI

struct WalkingDataView: View {
    let month: String
    let data: String
    let time: String

    var body: some View {
        VStack {
            Text(month)
            Text(data)
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
                .bold()
                .foregroundColor(.App.purpleDark)
            Text(time)
        }
    }
}

#Preview {
    WalkingDataView(month: "September", data: "12", time: "12:00 - 13:00")
}
