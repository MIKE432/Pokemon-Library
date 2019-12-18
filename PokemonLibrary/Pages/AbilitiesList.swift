//
//  AbilitiesList.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 17/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import SwiftUI

struct AbilitiesList: View {
    @State var networkingManager = NetworkingManager()
    
    var body: some View {
        List(networkingManager.abilityList.results, id: \.name) { ability in
            Text(ability.name.capitalized)
            
            .navigationBarTitle("Abilities")
        }
    }
    
    init() {
        networkingManager.getAbilities(100)
    }
}

struct AbilitiesList_Previews: PreviewProvider {
    static var previews: some View {
        Text("preview")
    }
}
