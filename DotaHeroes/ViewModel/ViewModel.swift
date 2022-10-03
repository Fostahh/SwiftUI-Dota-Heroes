//
//  ViewModel.swift
//  DotaHeroes
//
//  Created by Mohammad Azri on 03/10/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var heroes = [Hero]()
    
    func retrieveHeroes() {
        guard let url = URL(string: "https://api.opendota.com/api/heroes") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    self?.heroes = heroes
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
