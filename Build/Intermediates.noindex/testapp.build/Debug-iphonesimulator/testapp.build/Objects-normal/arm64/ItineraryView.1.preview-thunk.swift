import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/jorge/Desktop/testapp/testapp/ItineraryView.swift", line: 1)
//
//  ItineraryView.swift
//  TravelClimate
//
//  Created by Jorge Guerra on 11/12/24.
//
import SwiftData
import SwiftUI



struct ItineraryView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Place.sequence) var places: [Place]
    
    @State private var newTripAlert = false
    @State private var isAddingPlace = false
    @State private var tripStartDate = Date()
    @State private var selectedPlaces = Set<Place>()
    @State private var newPlace = Place(sequence: 01, name: "0", lon: 0, lat: 0, days: 0, countryCode: "0")
    
 //   @StateObject var fcsts : FcstVector
    @State private var fcst = FcstElement(tripDate: 0, minTemp: 10.5, maxTemp: 15.7, humidity: 0.4, pressure: 24.0, windSpeed: 22.0, windDirection:150.3)
    @State private var datePoint = 100
    @State private var vectorPoint = 0
    @State private var jNights: Int = 0
 
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(places)  { place in
                    
                    HStack {
                        Image(systemName: "\(place.sequence).circle")
                            .font(.headline)
                        Text(place.name)
                            .font(.headline)
                        Spacer()
                        Text(String(place.nights))
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete(perform: deletePlace)
            }
            .onAppear {
                if places.count == __designTimeInteger("#503_0", fallback: 0) {
                    newTripAlert = __designTimeBoolean("#503_1", fallback: true)
                }
                reSequence()
            }
            .navigationTitle(__designTimeString("#503_2", fallback: "Itinerary"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(__designTimeString("#503_3", fallback: "Change Trip")) {
                        newTripAlert = __designTimeBoolean("#503_4", fallback: true)
                    }
                }
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(__designTimeString("#503_5", fallback: "Add"), systemImage: __designTimeString("#503_6", fallback: "plus")) {
                            //                            isAddingPlace = true
                            newPlace = Place(sequence: places.count+__designTimeInteger("#503_7", fallback: 1), name: "London\(places.count+__designTimeInteger("#503_8", fallback: 1))", lon: __designTimeFloat("#503_9", fallback: -0.141), lat: __designTimeFloat("#503_10", fallback: 51.501), days: __designTimeInteger("#503_11", fallback: 2), countryCode: __designTimeString("#503_12", fallback: "GB"))
                            createTripDays()
                            
                            modelContext.insert(newPlace)
                        }
                    }
                }
           
                
                }
            
        .sheet(isPresented: $newTripAlert) {
            AddTripView()
        }
    }

    
    func deletePlace(at offsets: IndexSet) {
            for offset in offsets {
                // find this place in our query
                let place = places[offset]
                // delete it from the context
                modelContext.delete(place)}
            reSequence()
  
        }
    
    func reSequence() -> Void {
        for i in __designTimeInteger("#503_13", fallback: 0)..<places.count {
            places[i].sequence = i + __designTimeInteger("#503_14", fallback: 1) }
            }
    
    func createTripDays() -> Void {
        for jNights in __designTimeInteger("#503_15", fallback: 0)...newPlace.nights {
                if jNights > __designTimeInteger("#503_16", fallback: 0) {
                    datePoint += __designTimeInteger("#503_17", fallback: 1)
                }
                fcst.tripDate = datePoint
                newPlace.fcstVector.append(fcst)
 //               print("newFcst: \(newPlace.name) on \(newPlace.FcstVector.count) days: ")
            }
        }
    }
            

#Preview {
    ItineraryView()
        .modelContainer(for: Place.self)
}
