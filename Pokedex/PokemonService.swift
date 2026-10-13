//
//  PokemonService.swift
//  Pokedex
//
//  Created by Max Zelinka on 12/10/2026.
//

import Foundation

struct PokemonService {
    let baseURL: URL = URL(string: "https://pokeapi.co/api/v2/")!
    
    
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
        
        // "let pokemon = try decoder.decode("
        // “Use the decoder to build something, and store it in pokemon. This might fail, hence try...”
        // "PokemonResponse.self," - build it using the PokemonResponse blueprint
        // "from: data" - from the raw bytes we got from the server on line 20.
        let pokemon = try decoder.decode(PokemonResponse.self, from: data)
        return pokemon
    }
}

enum PokemonServiceError: Error {
    case invalidResponse
    case badStatusCode(Int)
}
