//
//  PokemonService.swift
//  Pokedex
//
//  Created by Max Zelinka on 12/10/2026.
//

import Foundation

struct PokemonService {
    let baseURL: URL = URL(string: "https://pokeapi.co/api/v2/")!
    
    
    // Shared helper: requests a URL, checks the response, and decodes the JSON into whatever type the caller asks for.
    // <T: Decodable>: T is a placeholder type, filled in by the caller's return type (e.g. PokemonResponse). It must be Decodable.
    // async: “this function waits for something”, in this case the internet.
    // throws: “this function might fail”.
    private func fetch <T: Decodable>(from url: URL) async throws -> T {
        
        // Allows the list of pokemon and all previously opened descriptions (pokemon & ability) to be loaded offline
        let newRequest = URLRequest(url: url,cachePolicy:.returnCacheDataElseLoad)
        // await: pause here (without freezing the screen) until the server replies.
        // try: this can fail (no Wi-Fi, for example). The error is passed up to whoever called fetch.
        let (data, response) = try await URLSession.shared.data(for: newRequest)
        
        // response is a general URLResponse, which has no status code. as? tries to treat it as an HTTPURLResponse (which does).
        // guard let: if that works, store it in httpResponse and carry on; if not (nil), throw an invalidResponse error.
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PokemonServiceError.invalidResponse
        }
        
        // Make sure the status code in the httpResponse is in the range 200–299 (success), otherwise throw a badStatusCode error.
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw PokemonServiceError.badStatusCode(httpResponse.statusCode)
        }
        
        // Make a JSON-reading tool and call it decoder.
        let decoder = JSONDecoder()
        
        // Converts JSON keys such as base_stat into baseStat.
        // a.b = .c means “set a’s b to the value c”. It writes something.
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // Build a T from the raw bytes the server sent. T.self is the blueprint; try because decoding can fail.
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
    
    // Fetches a single pokemon's properties from the pokeAPI and maps it to the PokemonResponse Struct
    func fetchPokemon(name: String) async throws -> PokemonResponse {
        let url = baseURL.appending(path: "pokemon/\(name)")
        return try await fetch(from: url)
    }
    
    //Fetches a list of pokemon from pokeAPI and maps it to the PokemonListResponse Struct
    func fetchPokemonList(limit: Int = 1351, offset: Int = 0) async throws -> PokemonListResponse {
        
        // queryItems automatically insert "?" or "&" for you
        let url = baseURL.appending(path: "pokemon").appending(queryItems: [
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ])
        return try await fetch(from: url)
    }
    
    //Fetches a Pokémon’s species data (descriptions) from PokeAPI
    func fetchSpecies(id: Int) async throws -> PokemonSpeciesResponse {
        let url = baseURL.appending(path: "pokemon-species/\(id)")
        return try await fetch(from: url)
    }
    
    //Fetches a Pokémon’s ability data (descriptions) from PokeAPI and maps to PokemonAbilityResponse
    func fetchAbility(name: String) async throws -> PokemonAbilityResponse {
        let url = baseURL.appending(path:"ability/\(name)")
        return try await fetch(from: url)
    }
}

enum PokemonServiceError: Error {
    case invalidResponse
    case badStatusCode(Int)
}
