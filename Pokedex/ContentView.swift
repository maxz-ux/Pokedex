//
//  ContentView.swift
//  Pokedex
//
//  Created by Max Zelinka on 03/10/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PokemonListView(pokemons:pokemonList)
    }
}

#Preview {
    ContentView()
}
