//
//  EmojiMemoryGame.swift
//  Test
//
//  Created by André Dias on 28/09/2022.
//

// MARK: - Supplement
//
// 1: Made "emojies" as a static property of the class itself and appended more emojies to the array
// 2: Initialized an empty Array of type Array<String> in the function "createMemoryGame" where "emojies" were before set
// 3: I shuffle the emojies array to change them around



import SwiftUI

class EmojiMemoryGame {
    private var game: MemoryGame<String> = createMemoryGame(numberOfPairsOfCards: Int.random(in: 2...5))
    private static var emojies: Array<String> = ["🍆","💦", "😩", "🔥", "💯", "😎", "🫡", "🎱", "🔫", "🏳️", "🥶", "🥸"]

    // MARK: - createMemoryGame function
    
    static func createMemoryGame(numberOfPairsOfCards: Int) -> MemoryGame<String> {
        
        var selectedEmojies: Array<String> = []
        
        emojies.shuffle()
        
        for i in 0...numberOfPairsOfCards {
            selectedEmojies.append(emojies[i])
        }
    
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards, cardContentFactory: { pairIndex in emojies[pairIndex] })
    }
    
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
