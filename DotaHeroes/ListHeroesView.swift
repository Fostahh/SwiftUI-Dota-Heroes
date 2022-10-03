//
//  ListHeroesView.swift
//  DotaHeroes
//
//  Created by Mohammad Azri on 03/10/22.
//

import SwiftUI

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
