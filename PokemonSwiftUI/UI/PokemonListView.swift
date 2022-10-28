//
//  PokemonListView.swift
//  PokemonSwiftUI
//
//  Created by Brais Moure on 28/10/22.
//

import SwiftUI

struct PokemonListView: View {
    
    @State var pokemonList: [Pokemon] = []
    
    var body: some View {
        
        NavigationView {
            
            List(pokemonList, id: \.name) { pokemon in
                PokemonCellView(pokemon: pokemon)
            }
            .onAppear() {
                
                PokemonApi().loadPokemon { result in
                    
                    switch result {
                    case .success(let pokemonList):
                        self.pokemonList = pokemonList
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            .navigationTitle("Pokémon list")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
