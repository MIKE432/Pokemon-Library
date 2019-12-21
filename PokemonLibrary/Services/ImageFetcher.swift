//
//  ImageFetcher.swift
//  PokemonLibrary
//
//  Created by Michał Raszczuk on 19/12/2019.
//  Copyright © 2019 Michał Raszczuk. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageFetcher: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data: Data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    func getPhoto(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }

        }.resume()
    }
}
