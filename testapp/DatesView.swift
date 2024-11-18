//
//  DatesView.swift
//  TravelClimate
//
//  Created by Jorge Guerra on 11/12/24.
//

import SwiftData
import SwiftUI

struct DatesView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Place.sequence) var places: [Place]
    var body: some View {
        NavigationStack {
            List {
                ForEach(places)  { place in
                    Section(place.name) {
                        DateListView(fcstVector: place.fcstVector)
//                        ForEach(0...places.fcstVector.count-1, id: \.id) { i in
//                            HStack {
//                                Text(places.fcstVector[i].date)
//                                Text(places.fcstVector[i].maxTemp)
//                            }
//                            
//                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DatesView()
}
