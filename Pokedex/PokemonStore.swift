//
//  PokemonStore.swift
//  Pokedex
//
//  Created by Max Zelinka on 22/10/2026.
//

import Foundation
import Observation

@Observable class PokemonStore {
    var loadedPokemon: [Pokemon]
    var isLoading: Bool
    var errorMessage: String?
    
    init(loadedPokemon: [Pokemon] = [], isLoading: Bool = false, errorMessage: String? = nil) {
        self.loadedPokemon = loadedPokemon
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }

    func loadPokemon() async {
        isLoading = true
        errorMessage = nil
        do {
            // Fetches a list of pokemon from PokeAPI
            let response = try await PokemonService().fetchPokemonList(limit: 151)
            var loadedPokemonList: [Pokemon] = []
            
            // Cycles through the list of pokemon in the response constant
            for pokemon in response.results {
                // Fetches the a single pokemon from the response List
                let listEntry = try await PokemonService().fetchPokemon(name: pokemon.name)
                // Creates a pokemon using the class using the data gathered in listEntry
                let entry = Pokemon(response: listEntry)
                // Appends this to new loadedPokemonList
                loadedPokemonList.append(entry)
            }
            // Declares the new loaded pokemon list as the loadedPokemon category
            loadedPokemon = loadedPokemonList
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
