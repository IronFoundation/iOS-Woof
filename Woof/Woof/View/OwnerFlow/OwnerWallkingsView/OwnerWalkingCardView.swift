import SwiftUI

struct OwnerWalkingCardView: View {
    let walking: Walking

    var body: some View {
        HStack {
            VStack {
                Text(walking.start, style: .date)
                    .italic()
                HStack {
                    Text(walking.start, style: .time)
                    Text("-")
                    Text(walking.end, style: .time)
                }
            }
            Spacer()
            VStack(spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                Text(fullName)
                    .bold()

                WalkingStatusLabel(status: walking.status)
            }

        }.padding()
            .background(Color.App.grayLight)
            .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
    }

    private var fullName: String {
        DataTransformer.fullName(name: walking.sitter.name, surname: walking.sitter.surname)
    }
}

#Preview {
    OwnerWalkingCardView(walking: Walking.Dummy.dummyWalking)
}
