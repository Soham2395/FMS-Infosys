import SwiftUI

//struct TripDetailsView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            HStack {
//                Button(action: { /* Go Back Action */ }) {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.blue)
//                    Text("Back")
//                        .foregroundColor(.blue)
//                }
//                Spacer()
//                Text("Trip Details")
//                    .font(.headline)
//                Spacer()
//            }
//            .padding()
//            
//            VStack(alignment: .leading, spacing: 12) {
//                HStack {
//                    Text("From")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                    Spacer()
//                    Text("Pending Assignment")
//                        .font(.caption)
//                        .padding(6)
//                        .background(Color.blue.opacity(0.2))
//                        .cornerRadius(10)
//                }
//                Text("123 Business Park, Los Angeles")
//                    .font(.body)
//                    .bold()
//                Divider()
//                
//                Text("To")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                Text("456 Industrial Zone, San Francisco")
//                    .font(.body)
//                    .bold()
//                Divider()
//                
//                HStack {
//                    Image(systemName: "calendar")
//                    Text("Delivery Date: Feb 15, 2024")
//                }
//                
//                .font(.subheadline)
//                Divider()
//                
//                HStack {
//                    Image(systemName: "map")
//                    Text("Geo Area")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                Text("Hilly area")
//                    .font(.body)
//                    .bold()
//            }
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            .padding(.horizontal)
//            
//            HStack(spacing: 16) {
//                Button(action: { /* Assign Driver Action */ }) {
//                    HStack {
//                        Image(systemName: "person.fill")
//                        Text("Assign Driver")
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//                
//                Button(action: { /* Assign Vehicle Action */ }) {
//                    HStack {
//                        Image(systemName: "car.fill")
//                        Text("Assign Vehicle")
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//            }
//            .padding(.horizontal)
//            
//            VStack(alignment: .leading, spacing: 12) {
//                Text("Driver")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                HStack {
//                    Image(systemName: "person.circle")
//                        .foregroundColor(.gray)
//                    Text("Not Assigned")
//                        .foregroundColor(.gray)
//                }
//                
//                Text("Vehicle")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                HStack {
//                    Image(systemName: "car.circle")
//                        .foregroundColor(.gray)
//                    Text("Not Assigned")
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding(.leading,-170)
//            .frame(maxWidth: 500,maxHeight: 150)
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            .padding(.horizontal)
//
//            
//            Spacer()
//            
//            Button(action: { /* Save Changes Action */ }) {
//                Text("Save Changes")
//                    .font(.headline)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//        }
//        .navigationBarHidden(true)
//    }
//}
//


import FirebaseFirestore


//struct TripDetailsView: View {
//    let trip: Trip
//    @State private var showDriverList = false
//    @State private var showVehicleList = false
//    @State private var showSuccessMessage = false
//    @State private var successMessage = ""
//    @State private var updatedTrip: Trip
//    
//    init(trip: Trip) {
//        self.trip = trip
//        // Initialize the updatedTrip state with the passed trip
//        _updatedTrip = State(initialValue: trip)
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            Text("Trip Details")
//                .font(.headline)
//                .padding()
//
//            VStack(alignment: .leading, spacing: 12) {
//                Text("From: \(updatedTrip.startLocation)")
//                    .font(.body)
//                    .bold()
//                Text("To: \(updatedTrip.endLocation)")
//                    .font(.body)
//                    .bold()
//                Text("Status: \(updatedTrip.TripStatus.rawValue)")
//                    .font(.body)
//                    .bold()
//                    .foregroundColor(getStatusColor(updatedTrip.TripStatus))
//                Text("Distance: \(updatedTrip.distance, specifier: "%.2f") km")
//                    .font(.body)
//                Text("Estimated Time: \(updatedTrip.estimatedTime, specifier: "%.2f") mins")
//                    .font(.body)
//            }
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            .padding(.horizontal)
//            
//            // Driver Information Section
//            VStack(alignment: .leading, spacing: 8) {
//                Text("Driver Information").font(.headline)
//                
//                if let driver = updatedTrip.assignedDriver {
//                    HStack {
//                        Image(systemName: "person.fill")
//                            .foregroundColor(.blue)
//                        VStack(alignment: .leading) {
//                            Text(driver.name).bold()
//                            Text(driver.email)
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                            Text("Experience: \(driver.experience.rawValue)")
//                                .font(.caption)
//                        }
//                    }
//                } else {
//                    HStack {
//                        Image(systemName: "person.circle")
//                            .foregroundColor(.gray)
//                        Text("Not Assigned")
//                            .foregroundColor(.gray)
//                    }
//                }
//            }
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            .padding(.horizontal)
//            
//            // Vehicle Information Section
//            VStack(alignment: .leading, spacing: 8) {
//                Text("Vehicle Information").font(.headline)
//                
//                if let vehicle = updatedTrip.assignedVehicle {
//                    HStack {
//                        Image(systemName: "car.fill")
//                            .foregroundColor(.blue)
//                        VStack(alignment: .leading) {
//                            Text("\(vehicle.model) (\(vehicle.type.rawValue))").bold()
//                            Text("Reg: \(vehicle.registrationNumber)")
//                                .font(.caption)
//                            Text("Fuel: \(vehicle.fuelType.rawValue)")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                } else {
//                    HStack {
//                        Image(systemName: "car.circle")
//                            .foregroundColor(.gray)
//                        Text("Not Assigned")
//                            .foregroundColor(.gray)
//                    }
//                }
//            }
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(12)
//            .padding(.horizontal)
//
//            // Buttons for Assigning Driver and Vehicle
//            HStack(spacing: 16) {
//                Button(action: { showDriverList = true }) {
//                    HStack {
//                        Image(systemName: "person.fill")
//                        Text(updatedTrip.assignedDriver == nil ? "Assign Driver" : "Change Driver")
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//
//                Button(action: { showVehicleList = true }) {
//                    HStack {
//                        Image(systemName: "car.fill")
//                        Text(updatedTrip.assignedVehicle == nil ? "Assign Vehicle" : "Change Vehicle")
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//            }
//            .padding(.horizontal)
//            
//            // Start Trip Button (enabled only when both driver and vehicle are assigned)
//            if updatedTrip.TripStatus == .scheduled && updatedTrip.assignedDriver != nil && updatedTrip.assignedVehicle != nil {
//                Button(action: { startTrip() }) {
//                    HStack {
//                        Image(systemName: "play.fill")
//                        Text("Start Trip")
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//                .padding(.horizontal)
//            }
//
//            Spacer()
//        }
//        .navigationTitle("Trip Details")
//        .sheet(isPresented: $showDriverList) {
//            AvailableDriverView(trip: trip) { assignedDriver in
//                assignDriver(assignedDriver)
//            }
//        }
//        .sheet(isPresented: $showVehicleList) {
//            AvailableVehicleView(trip: trip) { assignedVehicle in
//                assignVehicle(assignedVehicle)
//            }
//        }
//        .alert(isPresented: $showSuccessMessage) {
//            Alert(title: Text("Success"), message: Text(successMessage), dismissButton: .default(Text("OK")))
//        }
//        .onAppear {
//            // Refresh trip data when view appears
//            fetchUpdatedTripData()
//        }
//    }
//    
//    // Helper function to get status color
//    private func getStatusColor(_ status: TripStatus) -> Color {
//        switch status {
//        case .scheduled: return .orange
//        case .inprogress: return .blue
//        case .completed: return .green
//        }
//    }
//    
//    // Fetch the latest trip data from Firestore
//    private func fetchUpdatedTripData() {
//        guard let tripId = trip.id else { return }
//        
//        let db = Firestore.firestore()
//        db.collection("trips").document(tripId).getDocument { document, error in
//            if let error = error {
//                print("Error fetching trip data: \(error)")
//                return
//            }
//            
//            if let document = document, document.exists {
//                if let updatedTrip = try? document.data(as: Trip.self) {
//                    self.updatedTrip = updatedTrip
//                }
//            }
//        }
//    }
//
//    // Assign Driver to Trip
//    private func assignDriver(_ driver: Driver) {
//        guard let tripId = trip.id, let driverId = driver.id else { return }
//        
//        let db = Firestore.firestore()
//        let tripRef = db.collection("trips").document(tripId)
//        let driverRef = db.collection("users").document(driverId)
//        
//        // If there was a previous driver, update their status
//        if let previousDriver = updatedTrip.assignedDriver, let previousDriverId = previousDriver.id {
//            let prevDriverRef = db.collection("users").document(previousDriverId)
//            prevDriverRef.updateData([
//                "status": true,
//                "upcomingTrip": FieldValue.delete()
//            ])
//        }
//
//        // Update trip with assigned driver using transaction
//        db.runTransaction({ (transaction, errorPointer) -> Any? in
//            // Get the latest driver data
//            let driverSnapshot: DocumentSnapshot
//            do {
//                driverSnapshot = try transaction.getDocument(driverRef)
//            } catch let fetchError as NSError {
//                errorPointer?.pointee = fetchError
//                return nil
//            }
//            
//            // Verify driver is available
//            guard let driverData = driverSnapshot.data(),
//                  let isAvailable = driverData["status"] as? Bool,
//                  isAvailable else {
//                errorPointer?.pointee = NSError(
//                    domain: "AppErrorDomain",
//                    code: -1,
//                    userInfo: [NSLocalizedDescriptionKey: "Driver is no longer available"]
//                )
//                return nil
//            }
//            
//            // Create trip reference data
//            let tripReference = [
//                "id": tripId,
//                "startLocation": trip.startLocation,
//                "endLocation": trip.endLocation,
//                "tripDate": trip.tripDate
//            ] as [String : Any]
//            
//            // Update driver status and upcoming trip
//            transaction.updateData([
//                "status": false,
//                "upcomingTrip": tripReference
//            ], forDocument: driverRef)
//            
//            // Update trip with driver reference
//            transaction.updateData([
//                "assignedDriver": [
//                    "id": driver.id!,
//                    "name": driver.name,
//                    "email": driver.email,
//                    "phone": driver.phone,
//                    "experience": driver.experience.rawValue
//                ]
//            ], forDocument: tripRef)
//            
//            return nil
//        }) { (_, error) in
//            if let error = error {
//                print("Transaction failed: \(error)")
//                successMessage = "Failed to assign driver: \(error.localizedDescription)"
//            } else {
//                // Update local state
//                var updatedTripCopy = self.updatedTrip
//                updatedTripCopy.assignedDriver = driver
//                self.updatedTrip = updatedTripCopy
//                
//                successMessage = "Driver assigned successfully!"
//                checkAndUpdateTripStatus()
//            }
//            showSuccessMessage = true
//        }
//    }
//
//    // Assign Vehicle to Trip
//    private func assignVehicle(_ vehicle: Vehicle) {
//        guard let tripId = trip.id, let vehicleId = vehicle.id else { return }
//        
//        let db = Firestore.firestore()
//        let tripRef = db.collection("trips").document(tripId)
//        let vehicleRef = db.collection("vehicles").document(vehicleId)
//        
//        // If there was a previous vehicle, update its status
//        if let previousVehicle = updatedTrip.assignedVehicle, let previousVehicleId = previousVehicle.id {
//            let prevVehicleRef = db.collection("vehicles").document(previousVehicleId)
//            prevVehicleRef.updateData(["status": true])
//        }
//
//        db.runTransaction({ (transaction, errorPointer) -> Any? in
//            // Get the latest vehicle data
//            let vehicleSnapshot: DocumentSnapshot
//            do {
//                vehicleSnapshot = try transaction.getDocument(vehicleRef)
//            } catch let fetchError as NSError {
//                errorPointer?.pointee = fetchError
//                return nil
//            }
//            
//            // Verify vehicle is available
//            guard let vehicleData = vehicleSnapshot.data(),
//                  let isAvailable = vehicleData["status"] as? Bool,
//                  isAvailable else {
//                errorPointer?.pointee = NSError(
//                    domain: "AppErrorDomain",
//                    code: -1,
//                    userInfo: [NSLocalizedDescriptionKey: "Vehicle is no longer available"]
//                )
//                return nil
//            }
//
//            // Update trip with assigned vehicle
//            transaction.updateData([
//                "assignedVehicle": [
//                    "id": vehicle.id!,
//                    "type": vehicle.type.rawValue,
//                    "model": vehicle.model,
//                    "registrationNumber": vehicle.registrationNumber,
//                    "fuelType": vehicle.fuelType.rawValue
//                ]
//            ], forDocument: tripRef)
//
//            // Update vehicle status
//            transaction.updateData([
//                "status": false
//            ], forDocument: vehicleRef)
//
//            return nil
//        }) { (object, error) in
//            if let error = error {
//                print("Transaction failed: \(error)")
//                successMessage = "Failed to assign vehicle: \(error.localizedDescription)"
//            } else {
//                // Update local state
//                var updatedTripCopy = self.updatedTrip
//                updatedTripCopy.assignedVehicle = vehicle
//                self.updatedTrip = updatedTripCopy
//                
//                successMessage = "Vehicle assigned successfully!"
//                checkAndUpdateTripStatus()
//            }
//            showSuccessMessage = true
//        }
//    }
//    
//    // Check if both driver and vehicle are assigned, and update trip status if needed
//    private func checkAndUpdateTripStatus() {
//        if updatedTrip.assignedDriver != nil && updatedTrip.assignedVehicle != nil && updatedTrip.TripStatus == .scheduled {
//            successMessage += " Both driver and vehicle are now assigned. Trip is ready to start!"
//        }
//    }
//    
//    // Start the trip - change status to in progress
//    private func startTrip() {
//        guard let tripId = trip.id else { return }
//        
//        let db = Firestore.firestore()
//        let tripRef = db.collection("trips").document(tripId)
//        
//        tripRef.updateData([
//            "TripStatus": TripStatus.inprogress.rawValue
//        ]) { error in
//            if let error = error {
//                print("Error starting trip: \(error)")
//                successMessage = "Failed to start trip: \(error.localizedDescription)"
//            } else {
//                // Update local state
//                var updatedTripCopy = self.updatedTrip
//                updatedTripCopy.TripStatus = .inprogress
//                self.updatedTrip = updatedTripCopy
//                
//                successMessage = "Trip started successfully!"
//            }
//            showSuccessMessage = true
//        }
//    }
//}


struct TripDetailsView: View {
    let trip: Trip
    @State private var showDriverList = false
    @State private var showVehicleList = false
    @State private var showSuccessMessage = false
    @State private var successMessage = ""
    @State private var updatedTrip: Trip
    
    init(trip: Trip) {
        self.trip = trip
        _updatedTrip = State(initialValue: trip)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Trip Details")
                .font(.headline)
                .padding()

            VStack(alignment: .leading, spacing: 12) {
                Text("From: \(updatedTrip.startLocation)")
                    .font(.body)
                    .bold()
                Text("To: \(updatedTrip.endLocation)")
                    .font(.body)
                    .bold()
                Text("Status: \(updatedTrip.TripStatus.rawValue)")
                    .font(.body)
                    .bold()
                    .foregroundColor(getStatusColor(updatedTrip.TripStatus))
                Text("Distance: \(updatedTrip.distance, specifier: "%.2f") km")
                    .font(.body)
                Text("Estimated Time: \(updatedTrip.estimatedTime, specifier: "%.2f") mins")
                    .font(.body)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            
            // Driver Information Section
            VStack(alignment: .leading, spacing: 8) {
                Text("Driver Information").font(.headline)
                
                if let driver = updatedTrip.assignedDriver {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text(driver.name).bold()
                            Text(driver.email)
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("Experience: \(driver.experience.rawValue)")
                                .font(.caption)
                        }
                    }
                } else {
                    HStack {
                        Image(systemName: "person.circle")
                            .foregroundColor(.gray)
                        Text("Not Assigned")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            
            // Vehicle Information Section
            VStack(alignment: .leading, spacing: 8) {
                Text("Vehicle Information").font(.headline)
                
                if let vehicle = updatedTrip.assignedVehicle {
                    HStack {
                        Image(systemName: "car.fill")
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text("\(vehicle.model) (\(vehicle.type.rawValue))").bold()
                            Text("Reg: \(vehicle.registrationNumber)")
                                .font(.caption)
                            Text("Fuel: \(vehicle.fuelType.rawValue)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                } else {
                    HStack {
                        Image(systemName: "car.circle")
                            .foregroundColor(.gray)
                        Text("Not Assigned")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // Buttons for Assigning Driver and Vehicle
            HStack(spacing: 16) {
                Button(action: { showDriverList = true }) {
                    HStack {
                        Image(systemName: "person.fill")
                        Text(updatedTrip.assignedDriver == nil ? "Assign Driver" : "Change Driver")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                Button(action: { showVehicleList = true }) {
                    HStack {
                        Image(systemName: "car.fill")
                        Text(updatedTrip.assignedVehicle == nil ? "Assign Vehicle" : "Change Vehicle")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            // Start Trip Button (enabled only when both driver and vehicle are assigned)
            if updatedTrip.TripStatus == .scheduled && updatedTrip.assignedDriver != nil && updatedTrip.assignedVehicle != nil {
                Button(action: { startTrip() }) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Start Trip")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .navigationTitle("Trip Details")
        .sheet(isPresented: $showDriverList) {
            AvailableDriverView(trip: trip) { assignedDriver in
                assignDriver(assignedDriver)
            }
        }
        .sheet(isPresented: $showVehicleList) {
            AvailableVehicleView(trip: trip) { assignedVehicle in
                assignVehicle(assignedVehicle)
            }
        }
        .alert(isPresented: $showSuccessMessage) {
            Alert(title: Text("Success"), message: Text(successMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            fetchUpdatedTripData()
        }
    }
    
    private func getStatusColor(_ status: TripStatus) -> Color {
        switch status {
        case .scheduled: return .orange
        case .inprogress: return .blue
        case .completed: return .green
        }
    }
    
    private func fetchUpdatedTripData() {
        guard let tripId = trip.id else { return }
        
        let db = Firestore.firestore()
        db.collection("trips").document(tripId).getDocument { document, error in
            if let error = error {
                print("Error fetching trip data: \(error)")
                return
            }
            
            if let document = document, document.exists {
                if let updatedTrip = try? document.data(as: Trip.self) {
                    self.updatedTrip = updatedTrip
                }
            }
        }
    }

    private func assignDriver(_ driver: Driver) {
        guard let tripId = trip.id, let driverId = driver.id else { return }
        
        let db = Firestore.firestore()
        let tripRef = db.collection("trips").document(tripId)
        let driverRef = db.collection("users").document(driverId)
        
        if let previousDriver = updatedTrip.assignedDriver, let previousDriverId = previousDriver.id {
            let prevDriverRef = db.collection("users").document(previousDriverId)
            prevDriverRef.updateData([
                "status": true,
                "upcomingTrip": FieldValue.delete()
            ])
        }

        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let driverSnapshot: DocumentSnapshot
            do {
                driverSnapshot = try transaction.getDocument(driverRef)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard let driverData = driverSnapshot.data(),
                  let isAvailable = driverData["status"] as? Bool,
                  isAvailable else {
                errorPointer?.pointee = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Driver is no longer available"]
                )
                return nil
            }
            
            let tripReference = [
                "id": tripId,
                "startLocation": trip.startLocation,
                "endLocation": trip.endLocation,
                "tripDate": trip.tripDate
            ] as [String : Any]
            
            transaction.updateData([
                "status": false,
                "upcomingTrip": tripReference
            ], forDocument: driverRef)
            
            transaction.updateData([
                "assignedDriver": [
                    "id": driver.id!,
                    "name": driver.name,
                    "email": driver.email,
                    "phone": driver.phone,
                    "experience": driver.experience.rawValue
                ]
            ], forDocument: tripRef)
            
            return nil
        }) { (_, error) in
            if let error = error {
                print("Transaction failed: \(error)")
                successMessage = "Failed to assign driver: \(error.localizedDescription)"
            } else {
                var updatedTripCopy = self.updatedTrip
                updatedTripCopy.assignedDriver = driver
                self.updatedTrip = updatedTripCopy
                
                successMessage = "Driver assigned successfully!"
                checkAndUpdateTripStatus()
            }
            showSuccessMessage = true
        }
    }

    private func assignVehicle(_ vehicle: Vehicle) {
        guard let tripId = trip.id, let vehicleId = vehicle.id else { return }
        
        let db = Firestore.firestore()
        
        let tripRef = db.collection("trips").document(tripId)
        let vehicleRef = db.collection("vehicles").document(vehicleId)
        
        if let previousVehicle = updatedTrip.assignedVehicle, let previousVehicleId = previousVehicle.id {
            let prevVehicleRef = db.collection("vehicles").document(previousVehicleId)
            prevVehicleRef.updateData(["status": true])
        }

        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let vehicleSnapshot: DocumentSnapshot
            do {
                vehicleSnapshot = try transaction.getDocument(vehicleRef)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard let vehicleData = vehicleSnapshot.data(),
                  let isAvailable = vehicleData["status"] as? Bool,
                  isAvailable else {
                errorPointer?.pointee = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Vehicle is no longer available"]
                )
                return nil
            }
            

            
            transaction.updateData([
                "assignedVehicle": [
                    "id": vehicle.id!,
                    "type": vehicle.type.rawValue,
                    "model": vehicle.model,
                    "registrationNumber": vehicle.registrationNumber,
                    "fuelType": vehicle.fuelType.rawValue
                ]
            ], forDocument: tripRef)
            
            transaction.updateData([
                "status": false
            ], forDocument: vehicleRef)
            
            

            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
                successMessage = "Failed to assign vehicle: \(error.localizedDescription)"
            } else {
                var updatedTripCopy = self.updatedTrip
                updatedTripCopy.assignedVehicle = vehicle
                self.updatedTrip = updatedTripCopy
                
                successMessage = "Vehicle assigned successfully!"
                checkAndUpdateTripStatus()
            }
            showSuccessMessage = true
        }
    }
    
   
    private func checkAndUpdateTripStatus() {
        if updatedTrip.assignedDriver != nil && updatedTrip.assignedVehicle != nil && updatedTrip.TripStatus == .scheduled {
            successMessage += " Both driver and vehicle are now assigned. Trip is ready to start!"
        }
    }
    
    private func startTrip() {
        guard let tripId = trip.id else { return }
        
        let db = Firestore.firestore()
        let tripRef = db.collection("trips").document(tripId)
        
        tripRef.updateData([
            "TripStatus": TripStatus.inprogress.rawValue
        ]) { error in
            if let error = error {
                print("Error starting trip: \(error)")
                successMessage = "Failed to start trip: \(error.localizedDescription)"
            } else {
                var updatedTripCopy = self.updatedTrip
                updatedTripCopy.TripStatus = .inprogress
                self.updatedTrip = updatedTripCopy
                
                successMessage = "Trip started successfully!"
            }
            showSuccessMessage = true
        }
    }
}


struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsView(trip: Trip(
            tripDate: Date(),
            startLocation: "123 Business Park, Los Angeles",
            endLocation: "456 Industrial Zone, San Francisco",
            distance: 150.5,
            estimatedTime: 120.0,
            assignedDriver: nil,
            TripStatus: .scheduled,
            assignedVehicle: nil
        ))
    }
}
