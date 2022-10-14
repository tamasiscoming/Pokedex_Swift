//
//  ContentView.swift
//  Pokemon
//
//  Created by Nguyen Tamás on 2022. 10. 14..
//

import SwiftUI

struct ContentView: View {
    var pokemonModel = PokemonModel()
    @State private var pokemon = [Pokemon]()
    var body: some View {
        NavigationView {
            List(pokemon) { pokemon in
                /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
            }
        }
        .navigationTitle("Pokemon")
        .onAppear {
            async {
                pokemon = try! await pokemonModel.getPokemon()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
