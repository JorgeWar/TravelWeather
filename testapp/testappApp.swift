//
//  testappApp.swift
//  testapp
//
//  Created by Jorge Guerra on 11/17/24.
//

import SwiftUI

@main
struct testappApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Place.self)
    }
}
