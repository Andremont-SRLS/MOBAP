//
//  Array+Only.swift
//  MemoryGame
//
//  Created by André Dias on 04/10/2022.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
