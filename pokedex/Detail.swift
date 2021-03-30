//
//  Detail.swift
//  pokedex
//
//  Created by Raphael Freschi on 29/03/21.
//

import Foundation

// STATS

struct Detail: Decodable {
    
    var stats: [Stat]
    var abilities: [Ability]
    var types: [Type]
}

struct Stat: Decodable {
    var base_stat: Int
    var stat: Name
}

struct Name: Decodable {
    var name: String
}

// ABILITIES

struct Ability: Decodable {
    var ability: AbilityName
}

struct AbilityName: Decodable {
    var name: String
    var url: String
}

// DESCRIPTION

struct Description: Decodable {
    var effect_entries: [Effect]
}

struct Effect: Decodable {
    var effect: String
}
 
// TYPE

struct Type: Decodable {
    var type: TypeName
}

struct TypeName: Decodable {
    var name: String
}

// EVOLUTION

struct Chain: Decodable {
    var chain: Evolves
}

struct Evolves: Decodable {
    var evolves_to: [FirstEvolve]
    var species: FirstSpecie
}

struct FirstSpecie: Decodable {
    var name: String
    var url: String
}

struct FirstEvolve: Decodable {
    var evolves_to: [SecondEvolve]
    var species: SecondSpecie
}

struct SecondSpecie: Decodable {
    var name: String
    var url: String
}

struct SecondEvolve: Decodable {
    var species: ThirdSpecie
}

struct ThirdSpecie: Decodable {
    var name: String
    var url: String
}

// DISPLAYABLE

extension Stat: DisplayableDetails {
 
    var pokeStat: Name {
        self.stat
    }
    
    var pokeBaseStat: Int {
        self.base_stat
    }
    
}


extension Ability: DisplayableAbilities {

    var AbilitieName: AbilityName {
        self.ability
    }
    
}

 
extension Effect: DisplayableDesc {
    
    var effectText: String {
        self.effect
    }
    
}
 

extension Type: DisplayableType {
    
    var PokeType: TypeName {
        self.type
    }

}
