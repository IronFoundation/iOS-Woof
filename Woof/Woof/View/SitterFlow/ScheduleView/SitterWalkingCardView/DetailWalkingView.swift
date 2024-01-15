import MapKit
import SwiftUI

struct DetailWalkingView: View {
    let walkingStatus: String

    var body: some View {
        VStack {
            Text(walkingStatus)
                .foregroundColor(.App.grayLight)
                .fontWeight(.bold)
                .padding(AppStyle.UIElementConstant.minPadding)
                .background(Color.App.purpleDark)
                .clipShape(Capsule())

            ZStack {
                MapView()
                    .frame(height: 250)

                VStack {
                    Text("Wasraw, ul. Poli Gojawiczyńskiej 13")
                        .foregroundColor(.App.purpleDark)
                        .fontWeight(.medium)
                        .padding(AppStyle.UIElementConstant.minPadding)
                        .background(Color.App.grayLight)
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.App.purpleDark, lineWidth: 1)
                        )
                        .padding()
                        .background(Color.clear)
                        .offset(y: 80)
                }
            }

            HStack {
                VStack(alignment: .leading) {
                    Text("Walking with pet")
                        .font(Font.system(size: AppStyle.FontStyle.heading.size))
                        .bold()
                        .foregroundColor(.App.purpleDark)

                    Text("Owner: Anna")
                }

                Spacer()

                VStack {
                    Text("25$")
                        .font(Font.system(size: AppStyle.FontStyle.heading.size))
                        .bold()
                        .foregroundColor(.App.purpleDark)

                    Text("12:00 - 13:00")
                }
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
    DetailWalkingView(walkingStatus: "Pending")
}
