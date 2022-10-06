//
//  Theme.swift
//  MemoryGame
//
//  Created by André Dias on 05/10/2022.
//

import SwiftUI

struct MemoryGameTheme<Item> {
    
    var itemSet: [Item]
    
    init(itemSet: [Item]) {
        self.itemSet = itemSet
    }
    
}
