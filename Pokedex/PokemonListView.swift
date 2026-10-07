//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Max Zelinka on 04/10/2026.
//

import SwiftUI
import Foundation

struct PokemonListView: View {
    let pokemons: [Pokemon]
    var body: some View {
        NavigationStack {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("List of Pokemon")
                        .font(Font.title.bold())
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 32) {
                        ForEach(pokemons, id: \.id) { pokemon in
                            NavigationLink {
                                PokemonDetailView()
                            } label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    Image(systemName: "questionmark.circle")
                                        .font(.largeTitle)
                                        .foregroundStyle(Color(.white))
                                        .frame(width: 44, alignment: .leading)
                                    Text("#\(String(pokemon.id)) \(pokemon.name.capitalized)")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(pokemon.types.joined(separator: ", "))
                                        .foregroundColor(.white)
                                    HStack(spacing: 8) {
                                        Text("Height \(pokemon.height) Weight: \(pokemon.weight)")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            }
        }
    }
}


#Preview {
    PokemonListView(pokemons: pokemonList)
}
