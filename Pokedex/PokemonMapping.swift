//
//  PokemonMapping.swift
//  Pokedex
//
//  Created by Max Zelinka on 17/10/2026.
//

import Foundation

extension Pokemon {
    
    //response is the parameter: the PokemonResponse you got from fetchPokemon. Inside the init you read from it, e.g. response.id or response.sprites.frontDefault.
    convenience init(response: PokemonResponse) {
        let typeNames = response.types.map { $0.type.name }
        let abilities = response.abilities.map{ Ability(name: $0.ability.name, description: "", isHidden: $0.isHidden)}
        let hp = response.stats.first (where: {$0.stat.name == "hp"})?.baseStat ?? 0
        let attack = response.stats.first (where: {$0.stat.name == "attack"})?.baseStat ?? 0
        let defense = response.stats.first (where: {$0.stat.name == "defense"})?.baseStat ?? 0
        let specialAttack = response.stats.first (where: {$0.stat.name == "special-attack"})?.baseStat ?? 0
        let specialDefense = response.stats.first (where: {$0.stat.name == "special-defense"})?.baseStat ?? 0
        let speed = response.stats.first (where: {$0.stat.name == "speed"})?.baseStat ?? 0
        
        let pokemonStats = PokemonStats(hp: hp, attack: attack, defense: defense, specialAttack: specialAttack, specialDefense: specialDefense, speed: speed)
        
        // Maps the values from PokemonResponse onto the Pokemon Class
        self.init(id: response.id, name: response.name, description: "", height: response.height, weight: response.weight, types: typeNames, stats: pokemonStats, abilities: abilities, imageURL: response.sprites.frontDefault)
    }
   
}
