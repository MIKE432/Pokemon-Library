//
//  WebServices.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 18/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import Foundation

class WebService {
    
    func getPokemon(completion: @escaping ([Pokemon]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/ditto/") else {
            fatalError("URL not valid")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let pokemon = try!
                JSONDecoder().decode([Pokemon].self, from: data!)
            DispatchQueue.main.async {
                completion(pokemon)
            }
            
            
        }.resume()
    }
    
    
}
