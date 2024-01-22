import SwiftUI

struct BookingWalkingView: View {
    let walking: Walking
    var body: some View {
        VStack {
            Form {
                Section(content: {
                    HStack {
                        Text("Sitter:")
                        Spacer()
                        Text(walking.sitter.name)
                    }
                    HStack {
                        Text("Phone:")
                        Spacer()
                        Text(walking.sitter.phone)
                    }
                    HStack {
                        Text("Walking start:")
                        Spacer()
                        Text(walking.start.formatted(.dateTime))
                    }
                    HStack {
                        Text("Walking end:")
                        Spacer()
                        Text(walking.end.formatted(.dateTime))
                    }
                    HStack {
                        Text("Price:")
                        Spacer()
                        Text(walking.price, format: .currency(code: "USD"))
                    }
                }, header: {
                    Text("Sitter's info")
                })

                Section(content: {
                    VStack {
                        TextEditorWithPlaceholder(text: $address, placeholderText: "City, area, building, flat , etc.")
                        Divider()
                        NavigationLink {
                            MapView()
                        } label: {
                            Text("Select my location on map")
                                .foregroundColor(.App.purpleDark)
                        }
                    }
                }, header: {
                    Text("Enter your address")
                })

                Section(content: {
                    TextEditorWithPlaceholder(text: $notes, placeholderText: "For example, pick up the dog near the building")

                }, header: {
                    Text("Enter useful notes about your dog or place")
                })
            }

            Button("Confirm") {}

                .buttonStyle(PurpleCapsuleOfInfinityWidth())

                .padding()
        }.padding()
    }

    @State var notes = ""
    @State var address = ""
}

#Preview {
    BookingWalkingView(walking: Walking.Dummy.dummyWalking)
}
