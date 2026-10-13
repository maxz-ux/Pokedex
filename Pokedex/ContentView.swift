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
//            .task {
//            do {
//             let pokemon = try await PokemonService().fetchPokemon(id: 1)
//            print(pokemon)
//                    
//            } catch {
//                print(error)
//            }
//        }
    }
}

#Preview {
    ContentView()
}
