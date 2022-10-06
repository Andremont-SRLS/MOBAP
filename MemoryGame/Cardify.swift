//
//  File.swift
//  MemoryGame
//
//  Created by André Dias on 06/10/2022.
//

import SwiftUI


struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    
    func body(content: Content) -> some View {
        
        
        if card.isFaceUp {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: cardEdgeLineWidth)
            
        }
        else {
            if !card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius)
                // MARK: - Extra Credit - point 1
                // fill the back of the card with a gradient with the colors of the current theme
                .fill()
            }

        }
        
    }
}
