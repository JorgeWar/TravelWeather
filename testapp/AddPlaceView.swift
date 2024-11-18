//
//  AddPlaceView.swift
//  TravelClimate
//
//  Created by Jorge Guerra on 11/12/24.
//

import SwiftUI

struct AddPlaceView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    let placeCount : Int
  

    
    @State private var sequence = 0
    @State private var name = ""
    @State private var lon = 0.0
    @State private var lat = 0.0
    @State private var days = 1
    @State private var countryCode = ""
    

    var body: some View {
        NavigationStack {
            List {
               
                Section {
                    TextField("Location", text: $name)
                    TextField("Country Code", text: $countryCode )
                    Stepper("\(days) Days", value: $days, in: 1...14)
                }

                Section("Provide coordinates") {
                    TextField("Longitude", value: $lon, format: .number)
                    TextField("Latitude", value: $lat, format: .number)
                }

                Section {
                    let newSeq = placeCount + 1
                    HStack {
                        Button("Cancel") {
                            dismiss()
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Spacer()
                        Divider()
                        Spacer()
                            Button("Save") {
                                let newPlace = Place(sequence: newSeq, name: name, lon: lon, lat: lat, days: days, countryCode: countryCode)
                                modelContext.insert(newPlace)
                                dismiss()
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .disabled(name.isEmpty)
                        Spacer()
                        Divider()
                        Spacer()
                            Button("Save & Continue") {
                                
                                let newPlace = Place(sequence: newSeq, name: name, lon: lon, lat: lat, days: days, countryCode: countryCode)
                                modelContext.insert(newPlace)
                                
                                name = ""
                                lon = 0.0
                                lat = 0.0
                                days = 1
                                countryCode = ""
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .disabled(name.isEmpty)
                        }
                        
                    }
//                Section("Current itinerary") {
//                    ScrollView {
//                        ForEach (places) in place {
//                            
//                        }
//                    }
//                }
                }
           
            }
            .navigationTitle("Add new stop")
        }
    func findPlace (name: String) -> [String] {
        return ["TEST1","TEST2"]
    }
    
}

#Preview {
    AddPlaceView(placeCount: 0)
}
