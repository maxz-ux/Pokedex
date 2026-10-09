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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon:pokemonList[0])
}
