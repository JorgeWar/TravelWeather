import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/jorge/Desktop/testapp/testapp/ContentView.swift", line: 1)
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
                    Label(__designTimeString("#1691_0", fallback: "Itinerary"), systemImage: __designTimeString("#1691_1", fallback: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath.fill"))
                }
            DatesView()
                .tabItem {
                    Label(__designTimeString("#1691_2", fallback: "Dates"), systemImage: __designTimeString("#1691_3", fallback: "calendar.day.timeline.left"))
                }
            DatesView()
                .tabItem {
                    Label(__designTimeString("#1691_4", fallback: "Calendar"), systemImage: __designTimeString("#1691_5", fallback: "calendar"))
                }
            DatesView()
                .tabItem {
                    Label(__designTimeString("#1691_6", fallback: "Map"), systemImage: __designTimeString("#1691_7", fallback: "map"))
                }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
