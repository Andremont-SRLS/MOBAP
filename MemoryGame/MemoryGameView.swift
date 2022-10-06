//
//  ContentView.swift
//  Test
//
//  Created by André Dias on 23/09/2022.
//

import SwiftUI

struct MemoryGameView: View {

    @ObservedObject
    var viewGameModel: EmojiMemoryGame
    var body: some View {
        VStack{
            HStack {
                Text("Theme: " + String(viewGameModel.themeTitle))
                Text("Points: " + String(viewGameModel.score))
            }.padding()


            Grid(viewGameModel.cards) { card in
                
                CardView(themeGradient: viewGameModel.themeColor, card: card).onTapGesture {
                    self.viewGameModel.choose(card: card)
                }
                .padding()
            }
            .foregroundColor(viewGameModel.themeColor[0])
            Text("Restart game").onTapGesture {
                viewGameModel.restartGame()
            }
        }
        .font(Font.title)
        
    }

    
    // MARK: - MemoryGameView Constant
    let aspectRatio: CGFloat = 2/3
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MemoryGameView(viewGameModel: EmojiMemoryGame())
    }
}


struct CardView: View {
    
    var themeGradient: [Color]
    var card: MemoryGame<String>.Card
    var body: some View {
        
        GeometryReader { geometry in
            self.body(for: geometry.size, gradientColors: themeGradient )
        }
    }

    func body(for size: CGSize, gradientColors: [Color]) -> some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: cardEdgeLineWidth)
                Text(card.content)
            }
            else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                    // MARK: - Extra Credit - point 1
                    // fill the back of the card with a gradient with the colors of the current theme
                        .fill(LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom))
                }

            }
        }.font(self.fontSize(size: size))
    }
    
    func fontSize(size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * fontSizeMultiplier)
    }
    
    // MARK: - CardView Constants
    
    let cornerRadius: CGFloat = 10.0
    let cardEdgeLineWidth: CGFloat = 3
    let fontSizeMultiplier: CGFloat = 0.75
    
}
