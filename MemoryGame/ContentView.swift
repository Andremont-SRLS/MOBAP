//
//  ContentView.swift
//  Test
//
//  Created by André Dias on 23/09/2022.
//

import SwiftUI

struct ContentView: View {
    var viewGameModel: EmojiMemoryGame
    var body: some View {
             
            HStack {
                ForEach( viewGameModel.cards, content: { card in
                    GeometryReader { geometry in
                        CardView(card: card).onTapGesture {
                            viewGameModel.choose(card: card)
                        }
                        .frame(height: geometry.size.width*1.3)
                    }
                })
            }
            .foregroundColor(Color.orange)
            .padding()
            .font((viewGameModel.cards.count < 10 ? Font.largeTitle : Font.body))
        }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewGameModel: EmojiMemoryGame())
    }
}


struct CardView: View {
    
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack{
            if !card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
            else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
        }
    }
}
