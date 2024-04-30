import SwiftUI

/// A view representing a card displaying details of a walking.
struct SitterWalkingCardView: View {
    
    let start: Date
    let end: Date
    let name: String
    let city: String
    let address: String
    let status: WalkingStatus

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                    HStack {
                        Text(start, style: .time)
                        Text("-")
                        Text(end, style: .time)
                    }
                    .font(
                        .system(
                            size: AppStyle.FontStyle.body.size,
                            weight: .bold
                        )
                    )
                    Text(start, style: .date)
                        .italic()
                        .font(
                            .system(
                                size: AppStyle.FontStyle.footnote.size,
                                weight: .bold
                            )
                        )
                    WalkingStatusLabel(status: status)
                }
                .foregroundColor(.App.grayDark)

                Spacer()
                VStack(
                    alignment: .trailing,
                    spacing: AppStyle.UIElementConstant.spacingBetweenElements
                ) {
                    Text(name)
                        .bold()
                    Group {
                        Text(city)
                        Text(address)
                    }
                    .font(.system(size: AppStyle.FontStyle.footnote.size))
                }
            }
        }
        .padding()
        .background(Color.App.grayLight)
        .clipShape(
            RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius)
        )
    }
}

#Preview {
    SitterWalkingCardView(
        start: .now - 1200,
        end: .now,
        name: "Angela",
        city: "hometown",
        address: "my street, 25",
        status: .available
    )
}
