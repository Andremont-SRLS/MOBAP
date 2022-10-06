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

class EmojiMemoryGame: ObservableObject {
    
    @Published
    private var game: MemoryGame<String> = createMemoryGame(numberOfPairsOfCards: Int.random(in: 2...5), theme: GameThemes.allCases.randomElement()!)
    
    
    // MARK: - createMemoryGame function
    
    static func createMemoryGame(numberOfPairsOfCards: Int,theme selectedTheme: GameThemes) -> MemoryGame<String> {
        
        let selectedEmojies: Array<String> = selectedTheme.getItemList()
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards, selectedTheme: selectedTheme, cardContentFactory: { pairIndex in selectedEmojies[pairIndex] })
    }
    
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    var themeTitle: String {
        return "\(game.theme)"
    }
    
    var themeColor: [Color] {
        return game.theme.getThemeColor()
    }
    
    var score: Int {
        return game.scoreOfTheGame
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    func restartGame() {
        game = EmojiMemoryGame.createMemoryGame(numberOfPairsOfCards: Int.random(in: 2...5), theme: GameThemes.allCases.randomElement()!)
    }
    
    
}
