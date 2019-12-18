//
//  LandingPage.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 17/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("pokemon-logo")
                    .resizable()
                    .frame(width: 300, height: 200, alignment: .center)
                    .padding(.bottom, 300)
                
                NavigationLink(destination: Menu()) {
                    Text("Get Started")
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
        
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
