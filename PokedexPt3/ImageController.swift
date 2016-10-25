//
//  ImageController.swift
//  PokedexPt3
//
//  Created by Nathan Hopkins on 10/25/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import UIKit

class ImageController {
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: url) else { fatalError("Image URL optional is nil") }
        
        NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            guard let data = data, let image = UIImage(data: data) else { DispatchQueue.main.async { completion(nil) }
                return
            }
            
            DispatchQueue.main.async { completion(image) }
        }
    }
}
