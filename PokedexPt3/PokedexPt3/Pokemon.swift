//
//  Pokemon.swift
//  PokedexPt3
//
//  Created by Nathan Hopkins on 10/25/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import UIKit

class Pokemon {
    
    private let nameKey = "name"
    private let typeKey = "name"
    private let spriteKey = "front_default"
    private let movesKey = "moves"
    
    let spriteEndpoint: String
    let type: String
    let name: String
    let moveCount: Int
    var sprite: UIImage?
    
    init(spriteEndpoint: String, types: String, name: String, moveCount: Int) {
        self.spriteEndpoint = spriteEndpoint
        self.type = types
        self.name = name
        self.moveCount = moveCount
    }
    
    init?(dictionary: [String: Any]) {
        
        guard let name = dictionary[nameKey] as? String else { return nil }
        guard let typesArray = dictionary["types"] as? [[String: Any]],
            let typesDictionary = typesArray.first,
            let newTypeDictionary = typesDictionary["type"] as? [String: String],
            let typeName = newTypeDictionary[typeKey] else { return nil }
        guard let movesArray = dictionary[movesKey] as? [[String: Any]] else { return nil }
        guard let spritesDictionary = dictionary["sprites"] as? [String: Any], let spriteEndpoint = spritesDictionary[spriteKey] as? String else { return nil }
        
        self.spriteEndpoint = spriteEndpoint
        self.moveCount = movesArray.count
        self.name = name
        self.type = typeName
        
    }
    
}














