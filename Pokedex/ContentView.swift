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
        PokemonListView(pokemons:store.loadedPokemon)
            .task {
                // no try, because loadPokemon() handles its own errors.
                await store.loadPokemon()
            }
    }
}

#Preview {
    ContentView()
}
