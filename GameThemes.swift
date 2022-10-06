//
//  GameThemes.swift
//  MemoryGame
//
//  Created by André Dias on 06/10/2022.
//

import SwiftUI

enum GameThemes: CaseIterable {
    case Party
    case Rainbow
    case Flags
    case Casino
    case Love
    case Animals

    func getItemList() -> [String] {
        
        switch self {
            case .Party:   return ["🎉","🥳","🍾","🎁","🎈","🎊","🪅","🪩"]
            case .Rainbow: return ["🔴","🌧","🦄","🌂","🏳️‍🌈","🌦"]
            case .Flags:   return ["🇬🇧","🏴󠁧󠁢󠁥󠁮󠁧󠁿","🇺🇸","🇩🇰","🇸🇨","🇫🇲","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇲🇲","🇨🇮","🇺🇦"]
            case .Casino:  return ["🎰","🪙","💸","💰","🍀"]
            case .Love:    return ["❤️","🥰","💕","💝","👩‍❤️‍👨","💌","🫶"]
            case .Animals: return ["🐱","🐶","🐰","🐭","🐁","🦊","🐻"]
        }
        
    }

    func getThemeColor() -> [Color] {
        
        switch self {
            case .Party :  return [Color.purple, Color.pink]
            case .Rainbow: return [Color.blue, Color.cyan]
            case .Flags:   return [Color.gray, Color.black]
            case .Casino:  return [Color.green, Color.teal]
            case .Love:    return [Color.red, Color.purple]
            case .Animals: return [Color.brown, Color.yellow]
        }
        
    }
    
}
