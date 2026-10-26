//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Max Zelinka on 03/10/2026.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init() {
        // Gives the bulit-in cache more room to store responses in the same place
        // Allows for offline usage of the app up to 24 hours
        // Reserves 50MB for memory & 200MB for the disk (Calculated via bytes)
        URLCache.shared = URLCache(memoryCapacity: (50*1024*1024),diskCapacity: (200*1024*1024),directory: nil)
    }
}
