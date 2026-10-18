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
//                let pokemon = try await Pokemon(response: PokemonService().fetchPokemon(id: 1))
//                print(pokemon.id, pokemon.name, pokemon.height, pokemon.weight, pokemon.types, pokemon.stats.hp, pokemon.stats.attack, pokemon.stats.defense, pokemon.stats.specialAttack, pokemon.stats.specialDefense, pokemon.stats.speed, pokemon.abilities.map({ $0.name }))
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
