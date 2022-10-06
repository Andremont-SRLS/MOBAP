//
//  Array+Identifiable.swift
//  MemoryGame
//
//  Created by André Dias on 04/10/2022.
//
import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

