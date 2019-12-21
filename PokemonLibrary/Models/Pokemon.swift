//
//  Pokemon.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 17/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import Foundation


struct PokemonListEntry: Decodable {
    var name: String
    var url: String
}

struct PokemonAPIList: Decodable {
    var results: [PokemonListEntry]
}

struct AbilityListEntry: Decodable {
    var name: String
    var url: String
}

struct AbilityAPIList: Decodable {
    var results: [AbilityListEntry]
}

struct Pokemon: Decodable {
    var name: String
    var abilities: [Abilities]
    var height: Int
    var weight: Int
    var base_experience: Int
    var sprites: Sprites
}


struct Abilities: Decodable, Hashable {
    var ability: AbilityURL
    var slot: Int
}

struct AbilityURL: Decodable, Hashable {
    var name: String
    var url: String
}

struct Ability: Decodable {
    var name: String
    var effect_entries: [EffectEntries]
}

struct EffectEntries: Decodable {
    var effect: String
    var short_effect: String
}

struct Sprites: Decodable {
    var back_default: String
    var front_default: String
    var back_shiny: String
    var front_shiny: String
}
