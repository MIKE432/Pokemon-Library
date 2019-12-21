//
//  PokemonsList.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 17/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        
        Form {
            NavigationLink(destination: PokemonList()) {
                Text("Pokemons")
            }
            
            NavigationLink(destination: AbilitiesList()) {
                Text("Abilities")
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
