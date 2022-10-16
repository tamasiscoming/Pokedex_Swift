//
//  StatView.swift
//  Pokedex
//
//  Created by Nguyen Tamás on 2022. 10. 14..
//

import SwiftUI

struct StatView: View {
    var pokemon: Pokemon
    var statName: String
    var statColor: Color
    var statValue: Int
    let barWidth: CGFloat = 150
    
    var body: some View {
        HStack {
            Text(statName)
                .font(.system(.body, design: .monospaced))
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: barWidth, height: 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statColor)
                    .frame(width: statValue <= 100 ? barWidth * (CGFloat(statValue) / 100) : barWidth, height: 20)
            }
            
            Text("\(statValue)")
                .font(.system(.body, design: .monospaced))
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(pokemon: PokemonViewModel().MOCK_POKEMON, statName: "Atk", statColor: .red, statValue: 55)
    }
}
