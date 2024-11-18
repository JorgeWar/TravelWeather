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
                if places.count == 0 {
                    newTripAlert = true
                }
                reSequence()
            }
            .navigationTitle("Itinerary")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Change Trip") {
                        newTripAlert = true
                    }
                }
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus") {
                            //                            isAddingPlace = true
                            newPlace = Place(sequence: places.count+1, name: "London\(places.count+1)", lon: -0.141, lat: 51.501, days: 2, countryCode: "GB")
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
        for i in 0..<places.count {
            places[i].sequence = i + 1 }
            }
    
    func createTripDays() -> Void {
        for jNights in 0...newPlace.nights {
                if jNights > 0 {
                    datePoint += 1
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
