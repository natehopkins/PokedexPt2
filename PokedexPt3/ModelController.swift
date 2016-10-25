//
//  ModelController.swift
//  PokedexPt3
//
//  Created by Nathan Hopkins on 10/25/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon/")
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        let searchURL = baseURL?.appendingPathComponent(searchTerm.lowercased())
        guard let url = searchURL else { completion(nil); return }
        
            NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
                var pokemon: Pokemon? = nil
                
                defer { completion(pokemon) }
                if error != nil { print(error?.localizedDescription); return }
                
                guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else { print("No data returned from network request"); return }
                
                guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else { print("Error serializing JSON. \n Response: \(responseDataString)"); return }
                
                pokemon = Pokemon(dictionary: responseDictionary)
                
                return
        }
        
    }
    
}
