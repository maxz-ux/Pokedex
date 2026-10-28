//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Max Zelinka on 06/10/2026.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: Pokemon
    @State private var pokemonDescription = ""
    @State private var abilityDescriptions: [String:String] = [:]
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            ScrollView {
            VStack(alignment:.leading, spacing: 32) {
                VStack(alignment:.leading, spacing: 10){
                    PokemonSpriteView(url: pokemon.imageURL, size: 96)
                    Text(pokemon.name.capitalized)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Stats")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text(pokemon.types.joined(separator: ", ").capitalized)
                        .foregroundColor(.white)
                    HStack(spacing: 8) {
                        Text("Height \(pokemon.height) Weight: \(pokemon.weight)")
                            .foregroundColor(.white)
                    }
                }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Description")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text(pokemonDescription.isEmpty ? "No description available": pokemonDescription)
                            .foregroundColor(.white)
            }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Stats")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text("HP: \(pokemon.stats.hp)")
                        .foregroundColor(.white)
                    Text("Attack: \(pokemon.stats.attack)")
                        .foregroundColor(.white)
                    Text("Defense: \(pokemon.stats.defense)")
                        .foregroundColor(.white)
                    Text("Sp. Attack: \(pokemon.stats.specialAttack)")
                        .foregroundColor(.white)
                    Text("Sp. Defense: \(pokemon.stats.specialDefense)")
                        .foregroundColor(.white)
                    Text("Speed: \(pokemon.stats.speed)")
                        .foregroundColor(.white)
                }
                VStack(alignment:.leading, spacing: 4) {
                    Text("Abilities")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(pokemon.abilities.indices, id: \.self) { index in
                            let ability = pokemon.abilities[index]
                            VStack(alignment:.leading, spacing: 4) {
                                Text(ability.name.replacingOccurrences(of: "-", with: " ").capitalized)
                                    .foregroundColor(.white)
                                Text(abilityDescriptions[ability.name] ?? "No description available")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 20)
            } // ScrollView
        }
        .task {
            let pokemonSpecies = try? await PokemonService().fetchSpecies(id: pokemon.id)
            pokemonDescription = pokemonSpecies?.englishDescription ?? ""
            for ability in pokemon.abilities {
                let abilityResponse = try? await PokemonService().fetchAbility(name: ability.name)
                abilityDescriptions[ability.name] = abilityResponse?.englishDescription
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    PokemonDetailView(pokemon: pokemonList[0])
}
