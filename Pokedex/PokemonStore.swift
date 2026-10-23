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
            var results: [Pokemon] = []
            // the waiter hands all 151 orders to the kitchen at once (phase 1), then stands at the counter and picks each dish up as soon as it’s ready, in whatever order they come out (phase 2). Finally, they’re arranged in order (the sort).
    
            //"withThrowingTaskGroup" creates a group of tasks that can run at the same time. “Throwing” because the tasks inside can fail, which is why the line starts with try.
            //"of: PokemonResponse.self:" every task in the group must give back a PokemonResponse. It’s the “type of dish” each task returns.
            //"{ group in … }:" group is the group itself. You use it to add tasks and to collect results.
            //try await at the front: the whole group counts as one big piece of async work. This line waits until the closure finishes and returns the final array, which is stored in loadedPokemonList.
            let loadedPokemonList: [Pokemon] = try await withThrowingTaskGroup(of: PokemonResponse.self) { group in
                
                // Phase 1:
                for pokemon in response.results {
                    //starts a new child task that runs on its own. Crucially, addTask does not wait for it to finish; it starts the task and moves straight on.
                    group.addTask {
                        //Fetches a single pokemon from the response List
                        return try await PokemonService().fetchPokemon(name: pokemon.name)
                    }
                }
                
                // Phase 2:
                for try await entry in group {
                    // Creates a pokemon using the class using the data gathered in listEntry and appends to the responseList array
                    results.append(Pokemon(response: entry))
                    //results come back in the order they finish, not the order they were added. Pikachu might arrive before Bulbasaur.
                }
                // Returns the responseList for loadedPokemonList and sorts the list by id number
                return results.sorted(by: { $0.id < $1.id })
            }
            // Declares the new loaded pokemon list as the loadedPokemon category
            loadedPokemon = loadedPokemonList
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
