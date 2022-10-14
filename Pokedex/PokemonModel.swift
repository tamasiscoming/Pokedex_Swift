//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Nguyen Tamás on 2022. 10. 14..
//

import SwiftUI

struct Pokemon: Identifiable, Decodable {
    let pokeID = UUID()
    
    let id: Int
    let name: String
    let imageURL: String
    let type: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "imageUrl"
        case type
        case description
    }
}

enum FetchError: Error {
    case badURL
    case badResponse
    case badData
}

class PokemonModel {
    func getPokemon() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")
        else { throw FetchError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let data = data.removeNullsFrom(string: "null,") else { throw FetchError.badData}
//        Everything is good = 200
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badResponse }
        
        let maybePokemonData = try JSONDecoder().decode([Pokemon].self, from: data)
        return maybePokemonData
    }
}

extension Data {
    func removeNullsFrom(string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
