//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Max Zelinka on 06/10/2026.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: Pokemon
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            ScrollView {
            VStack(alignment:.leading, spacing: 32) {
                VStack(alignment:.leading, spacing: 10){
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44)
                        .foregroundColor(.white)
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
                    Text(pokemon.types.joined(separator: ", "))
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
                        Text(pokemon.description)
                            .foregroundColor(.white)
            }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Stats")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    ForEach(pokemon.stats.indices, id: \.self) { index in
                        let stat = pokemon.stats[index]
                        Text("HP: \(stat.hp)")
                            .foregroundColor(.white)
                        Text("Attack: \(stat.attack)")
                            .foregroundColor(.white)
                        Text("Defense: \(stat.defense)")
                            .foregroundColor(.white)
                        Text("Sp. Attack: \(stat.specialAttack)")
                            .foregroundColor(.white)
                        Text("Sp. Defense: \(stat.specialDefense)")
                            .foregroundColor(.white)
                        Text("Speed: \(stat.speed)")
                            .foregroundColor(.white)
                    }
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
                                Text(ability.name)
                                    .foregroundColor(.white)
                                Text(ability.description)
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
    }
}

#Preview {
    PokemonDetailView(pokemon: pokemonList[0])
}
