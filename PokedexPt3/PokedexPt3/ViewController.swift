//
//  ViewController.swift
//  PokedexPt3
//
//  Created by Nathan Hopkins on 10/25/16.
//  Copyright © 2016 NathanHopkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    //============================
    //  Mark: - Outlets
    //============================
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfMoves: UILabel!
    @IBOutlet weak var WTPLabel: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WTPLabel.layer.cornerRadius = 30
        WTPLabel.layer.masksToBounds = true
        
        searchBar.delegate = self
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        guard let searchTerm = searchBar.text else { return }
        PokemonController.fetchPokemon(for: searchTerm) { (pokemon) in
            guard let pokemon = pokemon else { return }
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            DispatchQueue.main.async {
                self.updateWith(pokemon: pokemon)
            }
        }
    }
    
    func updateWith(pokemon: Pokemon) {
        imageView.image = pokemon.sprite
        typesLabel.text = "Type: " + pokemon.type.capitalized
        nameLabel.text = pokemon.name.capitalized
        numberOfMoves.text = "Number of moves: " + String(pokemon.moveCount)
    }
}

