//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by André Dias on 30/09/2022.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            MemoryGameView(viewGameModel: EmojiMemoryGame())
        }
    }
}
