//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Nguyen Tamás on 2022. 10. 14..
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    var pokemon: Pokemon
    @State private var scale: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                
                Text(pokemon.type.capitalized)
                    .italic()
                    .foregroundColor(pokemon.typeColor)
                
                PokemonImage(image: KFImage(URL(string: pokemon.imageURL)))
                    .padding(.bottom, -100)
                    .zIndex(1)
                
                ZStack {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height-100)
                        .foregroundColor(pokemon.typeColor)
                    
                    VStack {
                        if pokemon.isFavorite {
                            Label("Favorite ", systemImage: "star.fill")
                                .foregroundColor(pokemon.typeColor)
                                .padding(5)
                                .background(Capsule()
                                    .foregroundColor(.white))
                        }
                        
                        Text(pokemon.description.replacingOccurrences(of: "\n", with: ""))
                            .foregroundColor(.white)
                            .padding()
                        
                        StatsViewGroup(pokemon: pokemon)
                    }
                    .offset(y: -40)
                    .scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.spring(dampingFraction: 0.3)
                        let repeated = baseAnimation.repeatCount(1)
                        
                        withAnimation(repeated) {
                            scale = 1
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
