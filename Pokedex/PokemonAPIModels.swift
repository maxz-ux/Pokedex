//
//  PokemonAPIModels.swift
//  Pokedex
//
//  Created by Max Zelinka on 12/10/2026.
//

import Foundation

struct PokemonResponse: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [TypeEntry] // response.types[0].type.name (calls "grass" for bulbasaur) is how to call this in app
    let abilities: [AbilityEntry]
    let stats: [StatEntry]
    let sprites: PokemonSprite
}

struct PokemonListResponse: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [LinkedName]
}

struct PokemonSpeciesResponse: Decodable {
    let flavorTextEntries: [FlavorTextEntry]
}

struct PokemonAbilityResponse: Decodable {
    let effectEntries: [EffectEntry]
    let flavorTextEntries: [FlavorTextEntry]
}

struct FlavorTextEntry: Decodable {
    let flavorText: String
    let language: LinkedName
}

struct StatEntry: Decodable {
    let baseStat: Int
    let stat: LinkedName
    let effort: Int
}

struct AbilityEntry: Decodable {
    let ability: LinkedName
    let isHidden: Bool
    let slot: Int
}

struct EffectEntry: Decodable {
    let effect: String
    let shortEffect: String
    let language: LinkedName
}

struct PokemonSprite: Decodable {
    let frontDefault: URL?
}

// Calls each type into the types property in PokemonResponse
struct TypeEntry: Decodable {
    let slot: Int
    let type: LinkedName
}

// Calls each entry in a JSON list with a Name/URL combo
struct LinkedName: Decodable {
    let name: String
    let url: String
}
