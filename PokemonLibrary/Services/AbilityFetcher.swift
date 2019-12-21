//
//  AbilityFetcher.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 20/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AbilityFetcher: ObservableObject {
    var didChange = PassthroughSubject<Ability, Never>()
    
    var ability = Ability(name: "", effect_entries: []) {
        didSet {
            didChange.send(ability)
        }
    }

    func getAbility(_ url: String) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let abilityJson = try! JSONDecoder().decode(Ability.self, from: data)
            
            DispatchQueue.main.async {
                self.ability = abilityJson
            }

        }.resume()
    }
}
