//
//  EmojitonyappGame.swift
//  tonyapp
//  this is the viewmodel
//  Created by Anthony Chua on 10/7/21.
//

import SwiftUI

class EmojitonyappGame: ObservableObject {
    //viewmodel tells world something changed everytime model changes.
    //static = type vars in this case
    static let emojis = ["🚚", "🚀", "⛽️", "🚆", "🚲", "🛸", "🛶", "🚁", "🏎", "🚓", "🚌", "🚜", "🚇", "🗿", "🏨"]
    
    //static = this function belongs to type EmojitonyappGame
    static func createMemoryGame() -> tonyappGame<String> {
        tonyappGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: tonyappGame<String> = createMemoryGame() //published keyworld tells world model changed
        
    
    var cards: Array<tonyappGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: tonyappGame<String>.Card) {
        model.choose(card)
    }
}
