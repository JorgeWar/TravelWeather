//
//  WeatherData.swift
//  TravelClimate
//
//  Created by Jorge Guerra on 11/13/24.
//

import Foundation

struct WeatherConstants {
    
    static let opènWeatherAPI = "b4ad52ba096f73169773e7e374cbe8df"
    
    // GEO API
    //    "http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}"
    
    static let geoURL =
    "http://api.openweathermap.org/geo/1.0/direct?q="
    
    // GEO API
    static let weatherURL = "https://api.openweathermap.org/data/2.5/weather?APPID=b4ad52ba096f73169773e7e374cbe8df&units=metric"
}

struct GeoData : Codable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country, state: String
}

struct WeatherData : Codable {
    let name : String
    let main: Main
    let weather: [Weather]
}

// MARK: - Welcome
struct Welcome: Codable {
    let lat, lon: Int
    let tz, date, units: String
    let cloudCover, humidity: CloudCover
    let precipitation: Precipitation
    let temperature: Temperature
    let pressure: CloudCover
    let wind: Wind

    enum CodingKeys: String, CodingKey {
        case lat, lon, tz, date, units
        case cloudCover
        case humidity, precipitation, temperature, pressure, wind
    }
}

// MARK: - CloudCover
struct CloudCover: Codable {
    let afternoon: Int
}

// MARK: - Precipitation
struct Precipitation: Codable {
    let total: Int
}

// MARK: - Temperature
struct Temperature: Codable {
    let min, max, afternoon, night: Double
    let evening, morning: Double
}

// MARK: - Wind
struct Wind: Codable {
    let max: Max
}

// MARK: - Max
struct Max: Codable {
    let speed: Double
    let direction: Int
}



struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
