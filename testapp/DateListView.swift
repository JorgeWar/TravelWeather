//
//  DateListView.swift
//  
//
//  Created by Jorge Guerra on 11/18/24.
//

import SwiftUI

struct DateListView: View {
    let fcstVector: [FcstElement]
    var body: some View {
        let count = fcstVector.count - 1
        ForEach(0...count, id: \.self) { i in
            HStack {
                Text(String(fcstVector[i].tripDate))
                Text(String(fcstVector[i].maxTemp))
            }
            
        }
    }
}

//#Preview {
//    DateListView(fcstVector: <#[FcstElement]#>)
//}
