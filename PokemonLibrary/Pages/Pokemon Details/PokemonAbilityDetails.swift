//
//  PokemonAbilityDetails.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 20/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import SwiftUI

struct PokemonAbilityDetails: View {
    @ObservedObject var abilityFetcher = AbilityFetcher()
    @State var ability: Ability = Ability(name: "", effect_entries: [])
    
    init(_ url: String) {
        abilityFetcher.getAbility(url)
    }
    
    var body: some View {
        Group {
            Section(header: Text("Short Effect")
                .onReceive(self.abilityFetcher.didChange, perform: { newAbility in self.ability = newAbility })
            ) {
                if(!ability.effect_entries.isEmpty) {
                    Text(ability.effect_entries[0].short_effect)
                }
            }
            
            Section(header: Text("Effect")) {
                if(!ability.effect_entries.isEmpty) {
                    Text(ability.effect_entries[0].effect)
                }
            }
        }
    }

}

struct PokemonAbilityDetails_Previews: PreviewProvider {
    static var previews: some View {
        Text("sa")
    }
}

