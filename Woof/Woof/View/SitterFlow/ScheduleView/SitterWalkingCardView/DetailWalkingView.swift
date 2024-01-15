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
                .background(Color.App.purpleLight)
                .clipShape(Capsule())

            ZStack {
                MapView()
                    .frame(height: 200)

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
                        .offset(y: 60)
                }
            }

            HStack {
                VStack(alignment: .leading) {
                    Text("Walking with Bobik")
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

struct MapView: UIViewRepresentable {
    func makeUIView(context _: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context _: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 52.2297, longitude: 21.0122)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

#Preview {
    DetailWalkingView(walkingStatus: "Pending")
}
