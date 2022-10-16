//
//  StatsViewGroup.swift
//  Pokedex
//
//  Created by Nguyen Tamás on 2022. 10. 14..
//

import SwiftUI

struct StatsViewGroup: View {
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 150)
                .foregroundColor(.white)
                .opacity(0.6)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 5) {
                StatView(pokemon: pokemon, statName: "Atk", statColor: .red, statValue: pokemon.attack)
                StatView(pokemon: pokemon, statName: "Def", statColor: .green, statValue: pokemon.defense)
                StatView(pokemon: pokemon, statName: "Hgt", statColor: .blue, statValue: pokemon.height)
                StatView(pokemon: pokemon, statName: "Wgt", statColor: .purple, statValue: pokemon.weight)
            }
        }
    }
}

struct StatsViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        StatsViewGroup(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
