import SwiftUI

struct OwnerBookingWalkingInfoView: View {
    @Binding var address: String
    @Binding var notes: String

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.wideSpacingSize) {
            VStack {
                HStack {
                    Text("Address:")
                        .foregroundColor(.App.grayDark)
                        .italic()
                    Spacer()
                    NavigationLink {
                        MapView()
                    } label: {
                        Text("Select on map")
                            .foregroundColor(.App.purpleDark)
                            .font(.system(size: AppStyle.FontStyle.footnote.size))
                    }
                }

                TextField("City, area, building, flat , etc.", text: $address)
                Divider()
            }
            VStack {
                Text("Enter useful notes about your dog or place")
                    .foregroundColor(.App.grayDark)
                    .italic()
                TextField("For example, pick up the dog near the building", text: $notes)
                Divider()
            }
            if address.isEmpty {
                Text("*Address is a mandatory field")
                    .italic()
                    .font(.system(size: AppStyle.FontStyle.footnote.size))
                    .foregroundColor(.App.purpleDark)
            }
        }.padding()
            .background(Color.App.grayLight)
            .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
    }
}

#Preview {
    VStack {
        OwnerBookingWalkingInfoView(
            address: .constant("Brest, vul.Scaryny, d.56"),
            notes: .constant("Call me 5 min before arriving")
        )
        OwnerBookingWalkingInfoView(
            address: .constant(""),
            notes: .constant("")
        )
    }
}
