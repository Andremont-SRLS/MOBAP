//
//  MemoryGame.swift
//  Test
//
//  Created by André Dias on 28/09/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var theme: GameThemes
    
    var indexOfTheFaceUpCard: Int? {
        get {cards.indices.filter { cards[$0].isFaceUp}.only}
        set {
            for index in cards.indices {
                
                cards[index].isFaceUp = index == newValue
                
            }
        }
    }
    
    var scoreOfTheGame: Int = 0
    
    
    // MARK: Extra credit point 2 - date variable
    // value will be updated when choosing the fisrt card of a pair
    var dateAfterChoosingCard: Date = Date()
    
    mutating func choose(card: Card) {
        
        
        
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    // MARK: Extra credit point 2 - number of seconds between choosing
                    // get the number of seconds between the current date and "dateAfterChoosingCard" variable
                    let secondsBetweenChoosing = Date().timeIntervalSince(dateAfterChoosingCard)
                    
                    // updateing the scopre witrh the max value beween 10 - time between choosing and 1
                    scoreOfTheGame = scoreOfTheGame + max(Int(round(10 - secondsBetweenChoosing)), 1);
                    
                    
                }
                else {
                    
                    if scoreOfTheGame > 0 {
                        scoreOfTheGame = scoreOfTheGame - 1
                    }

                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                // MARK: Extra credit point 2 - updating "dateAfterChoosingCard" with curtrent date after choosing the first card
                dateAfterChoosingCard = Date()
                indexOfTheFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, selectedTheme : GameThemes , cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        theme = selectedTheme
        
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
