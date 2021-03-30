//
//  Displayable.swift
//  pokedex
//
//  Created by Raphael Freschi on 29/03/21.
//

import Foundation

protocol Displayable {
    var name: String { get }
    var url: String { get } 
}

protocol DisplayableDetail: Decodable {
    var id: Int { get }
    var stats: [Stat] { get }
    var abilities: [Ability] { get }
    var types: [Type] { get }
}

protocol DisplayableDetails {
    var pokeStat: Name { get }
    var pokeBaseStat: Int { get }
}

protocol DisplayableAbilities {
    var AbilitieName: AbilityName { get }
}

protocol DisplayableDesc {
    var effectText: String { get }
}

protocol DisplayableType {
    var PokeType: TypeName { get }
}

protocol DisplayableEvolution {
    var chain: Evolves { get }
}

protocol DisplayableWithType {
    var pokemon: [PokemonType] { get }
}

