//
//  Place.swift
//  TravelClimate
//
//  Created by Jorge Guerra on 11/12/24.
//

import SwiftData
import SwiftUI

@Model
class Place {
    var id: UUID 
    var sequence: Int
    var name: String
    var lon: Double
    var lat: Double
    var nights: Int
    var countryCode: String
    var fcstVector: Array<FcstElement>
    
    init(sequence: Int,name: String, lon: Double, lat: Double, days: Int, countryCode: String) {
        self.id = UUID()
        self.sequence = sequence
        self.name = name
        self.lon = lon
        self.lat = lat
        self.nights = days
        self.countryCode = countryCode
        self.fcstVector = []
    }
    
}
    
//class FcstVector: ObservableObject {
//        @Published var fcsts = [Fcst]()
//    }
//    
    struct FcstElement: Codable, Identifiable {
        var id: UUID = UUID()
        var tripDate: Int
        var minTemp: Double
        var maxTemp: Double
        var humidity: Double
        var pressure: Double
        var windSpeed: Double
        var windDirection: Double
    }
    

