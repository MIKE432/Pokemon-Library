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

struct Pokemon: Codable {
    let id: Int
    let name: String
    let abilities: [Ability]
    let height: Int
    let weight: Int
}


struct Ability: Codable {
    let id: Int
    let name: String
    let url: String
    let slot: Int
}


//
//struct Pokemon: Hashable {
//    let id: UUID
//    let name: String
//    let abilities: Abilities
//    var height: Int
//    var weight: Int
//
//    init(_ name: String, _ abilities: Abilities, height: Int, weight: Int) {
//        self.abilities = abilities
//        self.height = height
//        self.name = name
//        self.weight = weight
//        self.id = UUID()
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//
//    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//}
