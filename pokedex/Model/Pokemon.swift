//
//  Pokemon.swift
//  pokedex
//
//  Created by Raphael Freschi on 29/03/21.
//

import Foundation

struct Pokemon: Decodable {
  let next: String
  let results: [Results]
  
}

struct PokemonWithType: Decodable {
    var pokemon: [PokemonType]
}

struct PokemonType: Decodable {
    var pokemon: Results
}

struct Results: Decodable {
    let name: String
    let url: String
    
}

extension Results: Displayable {
    var pokeName: String {
      name
    }
    
    var pokeUrl: String {
      url
    }
}


