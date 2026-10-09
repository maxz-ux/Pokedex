//
//  PokemonAbility.swift
//  Pokedex
//
//  Created by Max Zelinka on 08/10/2026.
//

class Ability {
    let name: String
    let description: String
    let isHidden: Bool
    
    init(name: String, description: String, isHidden: Bool) {
        self.name = name
        self.description = description
        self.isHidden = isHidden
    }
}

