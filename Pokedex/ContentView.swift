//
//  ContentView.swift
//  Pokedex
//
//  Created by Max Zelinka on 03/10/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var store = PokemonStore()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if store.isLoading {
                ProgressView("Loading Pokemon...")
            } else if let message = store.errorMessage {
                // Error State UI
                ContentUnavailableView {
                    // Text explaining Error
                    Label("Couldn't load Pokemon", systemImage: "exclamationmark.triangle")
                } description:  {
                    // Shows error message shown from loadPokemon
                    Text(message)
                } actions: {
                    // Recovery action Button
                    Button("Retry") {
                        Task {
                            // Attempts to load list
                            await store.loadPokemon()
                        }
                    }
                }
            } else {
                // Shows View once load is completed and no errors are encountered
                PokemonListView(pokemons:store.loadedPokemon)
            }
        }
        .task {
            // no try, because loadPokemon() handles its own errors.
            // Loads pokemon upon opening the app
            await store.loadPokemon()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
