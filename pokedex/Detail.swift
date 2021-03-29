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
}

struct Stat: Decodable {
    var base_stat: Int
    var stat: Name
}

struct Name: Decodable {
    var name: String
}

// ABILITIES

struct Abilities: Decodable {
    var abilities: [Ability]
}

struct Ability: Decodable {
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

struct Types: Decodable {
    var types: [Type]
}

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

