//
//  Pokemon.swift
//  Pokedex
//
//  Created by Max Zelinka on 03/10/2026.
//

import Foundation

class Pokemon: Identifiable {
    var id: Int
    var name: String
    var description: String
    var height: Int
    var weight: Int
    var types: [String]
    var stats: PokemonStats
    var abilities: [Ability]
    var imageURL: URL?
    
    init(id: Int, name: String, description: String, height: Int, weight: Int, types: [String], stats: PokemonStats, abilities: [Ability] = [], imageURL: URL?) {
        self.id = id
        self.name = name
        self.description = description
        self.height = height
        self.weight = weight
        self.types = types
        self.stats = stats
        self.abilities = abilities
        self.imageURL = imageURL
    }
}

