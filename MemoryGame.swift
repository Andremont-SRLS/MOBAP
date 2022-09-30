//
//  MemoryGame.swift
//  Test
//
//  Created by André Dias on 28/09/2022.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
        
    }
    
    // MARK: - INIT of MemoryGame
    //
    // The array of cards get shuffled to be displayed in a random order
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
    
        for pairIndex in 0..<numberOfPairsOfCards {
            
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }

        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
}
