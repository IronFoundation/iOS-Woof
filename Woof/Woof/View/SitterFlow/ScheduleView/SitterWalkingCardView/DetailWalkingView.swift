import MapKit
import SwiftUI

struct DetailWalkingView: View {
    let walkingStatus: String
    let day: String
    let month: String

    var body: some View {
        VStack {
            MapView()
                .frame(height: 250)
                .overlay {
                    MapPinLabel(text: "Wasraw, ul. Poli Gojawiczyńskiej 13")
                        .offset(y: 50)
                }

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Label("Anna", systemImage: "person.fill")

                        .font(Font.system(size: AppStyle.FontStyle.body.size).bold())
                    Label("+9787865765", systemImage: "phone.fill")
                        .font(Font.system(size: AppStyle.FontStyle.body.size).italic())
                    Text("Price: 25$")
                        .font(Font.system(size: AppStyle.FontStyle.heading.size))
                        .bold()
                        .foregroundColor(.App.purpleDark)
                }

                Spacer()
                VStack {
                    WalkingDataView(month: "October", data: "12", time: "12.00-14.00")

                    Text("Pending")
                        .foregroundColor(.App.grayLight)
                        .fontWeight(.bold)
                        .padding(AppStyle.UIElementConstant.minPadding)
                        .background(Color.App.grayDark)
                        .clipShape(Capsule())
                }
//                VStack {
//                    Text("25$")
//                        .font(Font.system(size: AppStyle.FontStyle.heading.size))
//                        .bold()
//                        .foregroundColor(.App.purpleDark)
//
//                    Text("12:00 - 13:00")
//                }
            }
            .padding()

            VStack(alignment: .leading) {
                Text("Notes:")

                Text("Thank you for taking care of my dog, Bobik. Here are some specific things to know about her: Enjoys playing fetch in the backyard.")
            }
            .padding()

            HStack {
                Button("Decline") {
                    print("accept")
                }

                Button("Accept") {
                    print("accept")
                }
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()

            Spacer()
        }
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.2297, longitude: 21.0122),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: false,
            userTrackingMode: nil,
            annotationItems: [
                CustomPin(coordinate: CLLocationCoordinate2D(latitude: 52.2297,
                                                             longitude: 21.0122)),
            ]) { pin in
                MapPin(coordinate: pin.coordinate, tint: .red)
            }
    }
}

class CustomPin: NSObject, Identifiable, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var id: String { UUID().uuidString }

    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

#Preview {
    DetailWalkingView(walkingStatus: "Pending", day: "12", month: "September")
}
