//
//  Pokemon.swift
//  Pokedex
//
//  Created by Max Zelinka on 03/10/2026.
//

class Pokemon: Identifiable {
    var id: Int
    var name: String
    var height: Int
    var weight: Int
    var types: [String]
    var stats: [PokemonStats]
    var abilities: [Ability]
    
    init(id: Int, name: String, height: Int, weight: Int, types: [String], stats: [PokemonStats] = [], abilities: [Ability] = []) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.types = types
        self.stats = stats
        self.abilities = abilities
    }
}

