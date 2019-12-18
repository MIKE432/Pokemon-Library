//
//  NetworkingManager.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 18/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkingManager, Never>()
    
    var pokemonList = PokemonAPIList(results: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    
    var abilityList = AbilityAPIList(results: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    func getPokemons(_ offset: Int) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(offset)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonAPIList.self, from: data)
            
            DispatchQueue.main.async {
                self.pokemonList = pokemonList
            }
            
        }.resume()
    }
}

extension NetworkingManager {

    func getAbilities(_ offset: Int = 500) {
         guard let url = URL(string: "https://pokeapi.co/api/v2/ability?limit=\(offset)") else {
                   return
               }
               
               URLSession.shared.dataTask(with: url) { (data, _, _) in
                   guard let data = data else { return }
                   
                   let abilityList = try! JSONDecoder().decode(AbilityAPIList.self, from: data)
                   
                   DispatchQueue.main.async {
                       self.abilityList = abilityList
                   }
                   
               }.resume()
    }
}
