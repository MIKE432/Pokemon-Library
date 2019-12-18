//
//  DemoData.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 17/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import Foundation


struct Demo {
    public var pokemons: [Pokemon]
    public var abilities: [Abilities]
    
    init() {
        
        //place to add new pokemons and new abilities
        
        let ability1 = Ability("imposter", "Moves cannot score critical", 1)
        let ability2 = Ability("black and white", "When pokemon is at full HP, any hit would knock it out will leave it with 1HP", 1)
        let ability3 = Ability("en", "prevents self destruct", 1)
        let ability4 = Ability("disaster", "Increases evasion to 1.25x during a sandstorm", 1)
        let ability5 = Ability("immune", "Has 30% chance of paralyzing attacking Pokemon on contact", 1)
        let ability6 = Ability("volt-absorb", "Absorbs electric moves, healing for 1/4 max HP", 1)
        let ability7 = Ability("water-absorb", "Absorb water moves, healing for 1/4 max HP", 1)
        let ability8 = Ability("imposter", "Prevents infatuation and protects against captivate", 1)
        let ability9 = Ability("cloud-nine", "Negaets all effects on weather, but does not prevent the weather itself", 1)
        
        self.abilities = [
            Abilities(ability1, secondary: ability2),
            Abilities(ability5, secondary: ability6),
            Abilities(ability3, secondary: ability4),
            Abilities(ability7, secondary: ability8),
            Abilities(ability9, secondary: ability1)
        ]
        
        self.pokemons = [
            Pokemon("ditto", abilities[0], height: 3, weight: 40),
            Pokemon("bulbasaur", abilities[1], height: 7, weight: 69),
            Pokemon("charmander", abilities[2], height: 6, weight: 85),
            Pokemon("catterpie", abilities[3], height: 10, weight: 35),
            Pokemon("kakuna", abilities[4], height: 5, weight: 55),
            Pokemon("pidgeot", abilities[0], height: 3, weight: 61),
            Pokemon("ratata", abilities[1], height: 8, weight: 31),
            Pokemon("ekans", abilities[2], height: 20, weight: 69)
        ]
    
    }
}
