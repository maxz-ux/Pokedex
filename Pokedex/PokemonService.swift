//
//  PokemonService.swift
//  Pokedex
//
//  Created by Max Zelinka on 12/10/2026.
//

import Foundation

struct PokemonService {
    let baseURL: URL = URL(string: "https://pokeapi.co/api/v2/")!
    
    // Fetches a single pokemon's properties from the pokeAPI and maps it to the PokemonResponse Struct
    // async: “this function waits for something”, in this case the internet.
    // throws: “this function might fail”.
    func fetchPokemon(id: Int) async throws -> PokemonResponse {
        let url = baseURL.appending(path: "pokemon/\(id)")
        // await: the app pauses here (without freezing the screen) until the server replies.
        // try: this can fail (no Wi-Fi, for example). If it does, the error is passed up to whoever called fetchPokemon.
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PokemonServiceError.invalidResponse
        }
        
        //guard    “Make sure the following is true...”
        //(200..<300)    “...the box of numbers from 200 to 299...”
        //.contains(    “...has inside it...”
        //httpResponse.statusCode    “...the status code from the server’s reply...”
        // else {    “...and if not, do what’s in this block. Return a badStatuscode error”
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw PokemonServiceError.badStatusCode(httpResponse.statusCode)
        }
        //Make a JSON-reading tool and call it decoder.
        let decoder = JSONDecoder()
        
        //converts JSON keys such as base_stat into baseStat
        //a.b = .c means “set a’s b to the value c”. It writes something.
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // "let pokemon = try decoder.decode("
        // “Use the decoder to build something, and store it in pokemon. This might fail, hence try...”
        // "PokemonResponse.self," - build it using the PokemonResponse blueprint
        // "from: data" - from the raw bytes we got from the server on line 20.
        let pokemon = try decoder.decode(PokemonResponse.self, from: data)
        return pokemon
    }
    
    //Fetches a list of pokemon from pokeAPI and maps it to the PokemonListResponse Struct
    func fetchPokemonList(limit: Int = 1351, offset: Int = 0) async throws -> PokemonListResponse {
        
        // queryItems automatically insert "?" or "&" for you
        let url = baseURL.appending(path: "pokemon").appending(queryItems: [
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ])
      
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PokemonServiceError.invalidResponse
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw PokemonServiceError.badStatusCode(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let pokemonList = try decoder.decode(PokemonListResponse.self, from: data)
        return pokemonList
    
    }
    
    //Fetches a Pokémon’s species data (descriptions) from PokeAPI
    func fetchSpecies(id: Int) async throws -> PokemonSpeciesResponse {
        let url = baseURL.appending(path: "pokemon-species/\(id)")
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PokemonServiceError.invalidResponse
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw PokemonServiceError.badStatusCode(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let pokemonSpecies = try decoder.decode(PokemonSpeciesResponse.self, from: data)
        return pokemonSpecies
    }
    
    //Fetches a Pokémon’s ability data (descriptions) from PokeAPI and maps to PokemonAbilityResponse
    func fetchAbility(name: String) async throws -> PokemonAbilityResponse {
        let url = baseURL.appending(path:"ability/\(name)")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PokemonServiceError.invalidResponse
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw PokemonServiceError.badStatusCode(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let pokemonAbility = try decoder.decode(PokemonAbilityResponse.self, from: data)
        return pokemonAbility
    }
}

enum PokemonServiceError: Error {
    case invalidResponse
    case badStatusCode(Int)
}
