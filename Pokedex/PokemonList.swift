//
//  PokemonList.swift
//  Pokedex
//
//  Created by Max Zelinka on 03/10/2026.
//

var abilities = abilityLibrary

var pokemonList: [Pokemon] = [
    Pokemon(id: 1, name: "Bulbasaur", height: 7, weight: 69, types: ["Grass", "Poison"], stats: [PokemonStats(hp: 45, attack: 49, defense: 49, specialAttack: 65, specialDefense: 65, speed: 45)], abilities: [abilities[0], abilities[8]]),
    Pokemon(id: 4, name: "Charmander", height: 6, weight: 85, types: ["Fire"], stats: [PokemonStats(hp: 39, attack: 52, defense: 43, specialAttack: 60, specialDefense: 50, speed: 65)], abilities: [abilities[1], abilities[9]]),
    Pokemon(id: 7, name: "Squirtle", height: 5, weight: 90, types: ["Water"], stats: [PokemonStats(hp: 44, attack: 48, defense: 65, specialAttack: 50, specialDefense: 64, speed: 43)], abilities: [abilities[2], abilities[25]]),
    Pokemon(id: 25, name: "Pikachu", height: 4, weight: 60, types: ["Electric"], stats: [PokemonStats(hp: 35, attack: 55, defense: 40, specialAttack: 50, specialDefense: 50, speed: 90)], abilities: [abilities[6], abilities[26]]),
    Pokemon(id: 39, name: "Jigglypuff", height: 5, weight: 55, types: ["Normal", "Fairy"], stats: [PokemonStats(hp: 115, attack: 45, defense: 20, specialAttack: 45, specialDefense: 25, speed: 20)], abilities: [abilities[27], abilities[28]]),
    Pokemon(id: 52, name: "Meowth", height: 4, weight: 42, types: ["Normal"], stats: [PokemonStats(hp: 40, attack: 45, defense: 35, specialAttack: 40, specialDefense: 40, speed: 90)], abilities: [abilities[21], abilities[29], abilities[24]]),
    Pokemon(id: 54, name: "Psyduck", height: 8, weight: 196, types: ["Water"], stats: [PokemonStats(hp: 50, attack: 52, defense: 48, specialAttack: 65, specialDefense: 50, speed: 55)], abilities: [abilities[22], abilities[30], abilities[7]]),
    Pokemon(id: 66, name: "Machop", height: 8, weight: 195, types: ["Fighting"], stats: [PokemonStats(hp: 70, attack: 80, defense: 50, specialAttack: 35, specialDefense: 35, speed: 35)], abilities: [abilities[15], abilities[16], abilities[31]]),
    Pokemon(id: 74, name: "Geodude", height: 4, weight: 200, types: ["Rock", "Ground"], stats: [PokemonStats(hp: 40, attack: 80, defense: 100, specialAttack: 30, specialDefense: 30, speed: 20)], abilities: [abilities[17], abilities[18], abilities[32]]),
    Pokemon(id: 133, name: "Eevee", height: 3, weight: 65, types: ["Normal"], stats: [PokemonStats(hp: 55, attack: 55, defense: 50, specialAttack: 45, specialDefense: 65, speed: 55)], abilities: [abilities[20], abilities[19], abilities[33]]),
    Pokemon(id: 143, name: "Snorlax", height: 21, weight: 4600, types: ["Normal"], stats: [PokemonStats(hp: 160, attack: 110, defense: 65, specialAttack: 65, specialDefense: 110, speed: 30)], abilities: [abilities[11], abilities[10], abilities[34]]),
    Pokemon(id: 147, name: "Dratini", height: 18, weight: 33, types: ["Dragon"], stats: [PokemonStats(hp: 41, attack: 64, defense: 45, specialAttack: 50, specialDefense: 50, speed: 50)], abilities: [abilities[12], abilities[35]]),
    Pokemon(id: 152, name: "Chikorita", height: 9, weight: 64, types: ["Grass"], stats: [PokemonStats(hp: 45, attack: 49, defense: 65, specialAttack: 49, specialDefense: 65, speed: 45)], abilities: [abilities[0], abilities[36]]),
    Pokemon(id: 155, name: "Cyndaquil", height: 5, weight: 79, types: ["Fire"], stats: [PokemonStats(hp: 39, attack: 52, defense: 43, specialAttack: 60, specialDefense: 50, speed: 65)], abilities: [abilities[1], abilities[37]]),
    Pokemon(id: 158, name: "Totodile", height: 6, weight: 95, types: ["Water"], stats: [PokemonStats(hp: 50, attack: 65, defense: 64, specialAttack: 44, specialDefense: 48, speed: 43)], abilities: [abilities[2], abilities[38]]),
    Pokemon(id: 175, name: "Togepi", height: 3, weight: 15, types: ["Fairy"], stats: [PokemonStats(hp: 35, attack: 20, defense: 65, specialAttack: 40, specialDefense: 65, speed: 20)], abilities: [abilities[13], abilities[14], abilities[39]]),
    Pokemon(id: 179, name: "Mareep", height: 6, weight: 78, types: ["Electric"], stats: [PokemonStats(hp: 55, attack: 40, defense: 40, specialAttack: 65, specialDefense: 45, speed: 35)], abilities: [abilities[6], abilities[40]]),
    Pokemon(id: 194, name: "Wooper", height: 4, weight: 85, types: ["Water", "Ground"], stats: [PokemonStats(hp: 55, attack: 45, defense: 45, specialAttack: 25, specialDefense: 25, speed: 15)], abilities: [abilities[22], abilities[41], abilities[42]]),
    Pokemon(id: 246, name: "Larvitar", height: 6, weight: 720, types: ["Rock", "Ground"], stats: [PokemonStats(hp: 50, attack: 64, defense: 50, specialAttack: 45, specialDefense: 50, speed: 41)], abilities: [abilities[15], abilities[32]]),
    Pokemon(id: 248, name: "Tyranitar", height: 20, weight: 2020, types: ["Rock", "Dark"], stats: [PokemonStats(hp: 100, attack: 134, defense: 110, specialAttack: 95, specialDefense: 100, speed: 61)], abilities: [abilities[23], abilities[24]])
]
