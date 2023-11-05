//
//  GameViewModel.swift
//  Memorize Demo
//
//  Created by Mac-Peerapat on 31/10/2566 BE.
//

import SwiftUI

class GameViewModel : ObservableObject{
    // Make static variable for use anywhere any life-cycle
    static var halloween = ["👻", "🎃", "🕷️", "👹", "🕸️", "🧙", "👿", "😱","🫥","👾", "🤡", "💀"]
    static let animals = ["🐶", "🐱", "🐹","🦊","🐻","🐼","🐮","🐷","🐶", "🐱", "🐹","🦊","🐻","🐼","🐮","🐷"]
    static let vehicles = ["🚗","🚌","🚓","🚑","🚜","✈️","🚀","🛸","🚗","🚌","🚓","🚑","🚜","✈️","🚀","🛸"]
    var i = 0
    @Published private var model: MemoryGameModel<String> = createModel()
    
    var cards: [MemoryGameModel<String>.Card] { return model.cards } // Computed variable
    
    static func createModel() -> MemoryGameModel<String> {
        let emojis = halloween.shuffled()
        var model = MemoryGameModel<String>(numberOfPairs: 8, contentFactory: {(index) in emojis[index]})
        model.shuffle()
        return model
    }
    
    func choose(_ card:MemoryGameModel<String>.Card){
        model.choose(card)
    }
    
    func restart(){
        model = GameViewModel.createModel()
    }
}
