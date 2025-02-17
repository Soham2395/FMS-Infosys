////
////  addNewTripView.swift
////  FMS
////
////  Created by Aastik Mehta on 14/02/25.
////
//
//import SwiftUI
//
//import FirebaseFirestore
//
//struct AlertMessage: Identifiable {
//    let id = UUID()
//    let message: String
//}
//
//
//
//class FirestoreService {
//    private let db = Firestore.firestore()
//    
//    // Function to add a new trip
//    func addTrip(trip: Trip, completion: @escaping (Result<Void, Error>) -> Void) {
//        do {
//            let tripRef = db.collection("trips").document(trip.id ?? UUID().uuidString)
//            try tripRef.setData(from: trip) { error in
//                if let error = error {
//                    completion(.failure(error))
//                } else {
//                    completion(.success(()))
//                }
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//}
//
//
//struct AddNewTripView: View {
//    
//    @State private var alertMessage: AlertMessage?
//    @State private var fromLocation: String = ""
//    @State private var toLocation: String = ""
//    @State private var selectedGeoArea: String = "Select Area"
//    @State private var deliveryDate: Date = Date()
//    @State private var geoAreas = ["Area 1", "Area 2", "Area 3"]
//    
//    @State private var isLoading = false
//    
//    
//    let firestoreService = FirestoreService()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Form {
//                    Section {
//                        TextField("Enter pickup location", text: $fromLocation)
//                        TextField("Enter destination", text: $toLocation)
//                    }
//                    
//                    Section {
//                        Picker(selection: $selectedGeoArea, label: Text(selectedGeoArea)) {
//                            ForEach(geoAreas, id: \.self) { area in
//                                Text(area).tag(area)
//                            }
//                        }
//                        .pickerStyle(MenuPickerStyle())
//                    }
//                    
//                    Section {
//                        DatePicker("Delivery Date", selection: $deliveryDate, displayedComponents: .date)
//                    }
//                }
//                
//                if isLoading {
//                    ProgressView()
//                } else {
//                    Button(action: createTrip) {
//                        Text("Create Trip")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color.blue)
//                            .cornerRadius(8)
//                    }
//                    .padding()
//                }
//                
//                Spacer()
//            }
//            .alert(item: $alertMessage) { alert in
//                Alert(title: Text("Error"), message: Text(alert.message), dismissButton: .default(Text("OK")))
//            }
//            .navigationBarTitle("Add New Trip", displayMode: .inline)
//        }
//    }
//    
//    private func createTrip() {
//        guard !fromLocation.isEmpty, !toLocation.isEmpty, selectedGeoArea != "Select Area" else {
//            alertMessage = AlertMessage(message: "Please fill all fields correctly.")
//
//            return
//        }
//        
//        isLoading = true
//        
//        let newTrip = Trip(
//            tripDate: deliveryDate,
//            startLocation: fromLocation,
//            endLocation: toLocation,
//            distance: 0.0,  // Distance calculation can be added later
//            estimatedTime: 0.0,
//            assignedDriver: nil, // You may allow selecting a driver
//            TripStatus: .scheduled
//        )
//        
//        firestoreService.addTrip(trip: newTrip) { result in
//            isLoading = false
//            switch result {
//            case .success:
//                print("Trip added successfully!")
//            case .failure(let error):
//                alertMessage = AlertMessage(message: error.localizedDescription)
//
//            }
//        }
//    }
//}
//
//
//
//
//
//struct TripListView: View {
//    @State private var trips: [Trip] = []
//    private let db = Firestore.firestore()
//    
//    var body: some View {
//        List(trips, id: \.id) { trip in
//            VStack(alignment: .leading) {
//                Text("From: \(trip.startLocation) → To: \(trip.endLocation)")
//                    .font(.headline)
//                Text("Status: \(trip.TripStatus.rawValue)")
//                    .font(.subheadline)
//            }
//        }
//        .onAppear(perform: fetchTrips)
//        .navigationTitle("Trips")
//    }
//    
//    private func fetchTrips() {
//        db.collection("trips").getDocuments { snapshot, error in
//            guard let documents = snapshot?.documents, error == nil else {
//                print("Error fetching trips: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            self.trips = documents.compactMap { doc in
//                try? doc.data(as: Trip.self)
//            }
//        }
//    }
//}
//
//struct TripListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TripListView()
//    }
//}
