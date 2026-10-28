//
//  PokemonList.swift
//  Pokedex
//
//  Created by Max Zelinka on 03/10/2026.
//

var abilities = abilityLibrary

var pokemonList: [Pokemon] = [
    Pokemon(id: 1, name: "Bulbasaur", description: "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.", height: 7, weight: 69, types: ["Grass", "Poison"], stats: PokemonStats(hp: 45, attack: 49, defense: 49, specialAttack: 65, specialDefense: 65, speed: 45), abilities: [abilities[0], abilities[3]], imageURL: nil),
    Pokemon(id: 4, name: "Charmander", description: "The flame at the tip of its tail makes a sound as it burns. You can only hear it in quiet places.", height: 6, weight: 85, types: ["Fire"], stats: PokemonStats(hp: 39, attack: 52, defense: 43, specialAttack: 60, specialDefense: 50, speed: 65), abilities: [abilities[1], abilities[4]], imageURL: nil),
    Pokemon(id: 7, name: "Squirtle", description: "After birth, its back swells and hardens into a shell. It sprays a potent foam from its mouth.", height: 5, weight: 90, types: ["Water"], stats: PokemonStats(hp: 44, attack: 48, defense: 65, specialAttack: 50, specialDefense: 64, speed: 43), abilities: [abilities[2], abilities[5]], imageURL: nil)
]
