import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/jorge/Desktop/testapp/testapp/AddTripView.swift", line: 1)
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
            TextField(__designTimeString("#5047_0", fallback: "Trip Name"), text: $trip.tripName)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(__designTimeBoolean("#5047_1", fallback: true))
                .padding()
            TextField(__designTimeString("#5047_2", fallback: "Trip Description"), text: $trip.tripDescription, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding()
            DatePicker(__designTimeString("#5047_3", fallback: "Trip Start Date"), selection: $trip.startDate, in: Date.now..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
        }
    }
}

#Preview {
    AddTripView()
}
