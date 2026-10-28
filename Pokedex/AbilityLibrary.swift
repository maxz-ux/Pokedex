//
//  AbilityLibrary.swift
//  Pokedex
//
//  Created by Max Zelinka on 08/10/2026.
//

var abilityLibrary: [Ability] =

[
    Ability(
        name: "Overgrow",
        description: "Powers up Grass-type moves when the Pokémon's HP is low.",
        isHidden: false
    ),
    Ability(
        name: "Blaze",
        description: "Powers up Fire-type moves when the Pokémon's HP is low.",
        isHidden: false
    ),
    Ability(
        name: "Torrent",
        description: "Powers up Water-type moves when the Pokémon's HP is low.",
        isHidden: false
    ),
    Ability(
        name: "Chlorophyll",
        description: "Boosts the Pokémon's Speed stat in harsh sunlight.",
        isHidden: false
    ),
    Ability(
        name: "Solar Power",
        description: "In harsh sunlight, the Pokémon's Sp. Atk is boosted, but its HP decreases every turn.",
        isHidden: true
    ),
    Ability(
        name: "Rain Dish",
        description: "The Pokémon gradually regains HP in rain.",
        isHidden: true
    )
]
