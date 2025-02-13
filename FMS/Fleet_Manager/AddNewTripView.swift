import SwiftUI

struct AddNewTripView: View {
    @State private var fromLocation: String = ""
    @State private var toLocation: String = ""
    @State private var terrainType: String = "Select Type"
    @State private var deliveryDate: Date = Date()
    @FocusState private var activeField: String?

    let terrainTypes = ["Mountain", "Desert", "Forest", "Urban", "Rural"]

    @StateObject private var fromLocationVM = LocationSearchViewModel()
    @StateObject private var toLocationVM = LocationSearchViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Pickup Location
                VStack(alignment: .leading) {
                    Text("Pickup Location")
                        .font(.headline)

                    LocationInputField(text: $fromLocation, searchViewModel: fromLocationVM, placeholder: "Enter pickup location")
                }

                // Destination
                VStack(alignment: .leading) {
                    Text("Destination")
                        .font(.headline)

                    LocationInputField(text: $toLocation, searchViewModel: toLocationVM, placeholder: "Enter destination")
                }

                // Terrain Type Picker
                VStack(alignment: .leading) {
                    Text("Terrain Type")
                        .font(.headline)

                    Menu {
                        ForEach(terrainTypes, id: \.self) { type in
                            Button(type) {
                                terrainType = type
                            }
                        }
                    } label: {
                        HStack {
                            Text(terrainType)
                                .foregroundColor(terrainType == "Select Type" ? .gray : .black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }

                // Delivery Date Picker
                VStack(alignment: .leading) {
                    Text("Delivery Date")
                        .font(.headline)

                    DatePicker("Select Date", selection: $deliveryDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }

                // Create Trip Button
                Button(action: {
                    print("Trip Created with From: \(fromLocation), To: \(toLocation), Terrain: \(terrainType)")
                }) {
                    Text("Create Trip")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Spacer()
            }
            .padding()
        }
        .scrollDismissesKeyboard(.interactively) // Prevents keyboard from blocking UI
        .navigationTitle("Add New Trip")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview{
    AddNewTripView()
}
