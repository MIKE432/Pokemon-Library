//
//  PokemonDetails.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 19/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import SwiftUI

struct PokemonPhoto: View {
    
    @ObservedObject var imageFetcher: ImageFetcher = ImageFetcher()
    @State var photo: Data = Data()
    
    var stateContent: some View {
        if let image = UIImage(data: self.photo) {
            return AnyView(Image(uiImage: image).resizable().aspectRatio(7/7, contentMode: .fit).onReceive(self.imageFetcher.didChange, perform: { photo in self.photo = photo }))
        } else {
            return AnyView(ActivityIndicator(style: .medium).onReceive(self.imageFetcher.didChange, perform: { photo in self.photo = photo }))
        }
    }
    
    init(with url: String) {
        imageFetcher.getPhoto(url)
    }
    
    var body: some View {
        HStack {
            stateContent
        }
    }
}

func DetailsSectionInformation(_ title: String, _ value: String) -> some View {
    HStack {
        Text(title)
            .fontWeight(.bold)
        Spacer()
        Text(value)
    }
}

struct PokemonDetails: View {
    
    @State var networkingManager = NetworkingManager()
    let navigationTitle = "Details"
    @State var actualAbility = 0;
    
    var body: some View {
        Group {
            Form {
                Section(header: Text("Informations")) {
                    PokemonPhoto(with: networkingManager.actualPokemon.sprites.front_default)
                    DetailsSectionInformation("Name", networkingManager.actualPokemon.name.capitalized)
                    DetailsSectionInformation("Weight", String(networkingManager.actualPokemon.weight))
                    DetailsSectionInformation("Height", String(networkingManager.actualPokemon.height))
                    DetailsSectionInformation("Base experience",
                                              String(networkingManager.actualPokemon.base_experience))
                }
                Section(header: Text("Abilities")) {
                    Picker("Abilities", selection: $actualAbility) {
                        ForEach(0..<networkingManager.actualPokemon.abilities.count) { number in
                            Text("\(self.networkingManager.actualPokemon.abilities[number].ability.name)")
                        }

                    }
                    .pickerStyle(SegmentedPickerStyle())

                }
                PokemonAbilityDetails(self.networkingManager.actualPokemon.abilities[actualAbility].ability.url)
            }
            .navigationBarTitle(navigationTitle)
        }
    }
    
    init(_ name: String) {
        networkingManager.getPokemon(name)
    }
}

struct PokemonDetails_Previews: PreviewProvider {
    static var previews: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}
