//
//  ListHeroesView.swift
//  DotaHeroes
//
//  Created by Mohammad Azri on 03/10/22.
//

import SwiftUI

struct Hero: Codable, Hashable {
    let id : Int
    let name : String
    let attribute: PrimaryAttribute
    
    enum CodingKeys : String, CodingKey {
        case id
        case name = "localized_name"
        case attribute = "primary_attr"
    }
}

enum PrimaryAttribute : String, Codable {
    case agi = "agi"
    case int = "int"
    case str = "str"
}

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

struct ListHeroesView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.heroes, id: \.self) { hero in
                    VStack(alignment: .leading) {
                        Text(hero.name).fontWeight(.semibold)
                        Text(hero.attribute.rawValue)
                    }.padding(4)
                }
            }.navigationTitle("Dota Heroes")
        }.onAppear {
            viewModel.retrieveHeroes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeroesView()
    }
}
