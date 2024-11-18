//
//  ContentView.swift
//  testapp
//
//  Created by Jorge Guerra on 11/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ItineraryView()
                .tabItem {
                    Label("Itinerary", systemImage: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath.fill")
                }
            DatesView()
                .tabItem {
                    Label("Dates", systemImage: "calendar.day.timeline.left")
                }
            DatesView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            DatesView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
