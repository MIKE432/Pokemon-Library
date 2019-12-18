//
//  PokemonList.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 17/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    @State var networkingManager = NetworkingManager()
    
    var body: some View {
        List(networkingManager.pokemonList.results, id: \.name) { pokemon in
            Text(pokemon.name.capitalized)
            
            .navigationBarTitle("Pokemons")
        }
    }
    
    init() {
        networkingManager.getPokemons(100)
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        Text("sad")
    }
}
