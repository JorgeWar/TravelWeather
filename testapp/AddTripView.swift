//
//  AddTripView.swift
//  testapp
//
//  Created by Jorge Guerra on 11/18/24.
//

import SwiftUI

class Trip: ObservableObject {
    var tripName = ""
    var tripDescription = ""
    var startDate = Date()
}

struct AddTripView: View {
    @StateObject private var trip = Trip()
    
    var body: some View {
        VStack {
            TextField("Trip Name", text: $trip.tripName)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
            TextField("Trip Description", text: $trip.tripDescription, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding()
            DatePicker("Trip Start Date", selection: $trip.startDate, in: Date.now..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
        }
    }
}

#Preview {
    AddTripView()
}
