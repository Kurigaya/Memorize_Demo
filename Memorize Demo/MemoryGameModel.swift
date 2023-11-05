//
//  MemoryGameModel.swift
//  Memorize Demo
//
//  Created by Mac-Peerapat on 31/10/2566 BE.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable{
//    var a = Text(){}
//    var b = a // At this point b = Text() //that the same object as >> a //but when we edit something of these two, it will seperate obj to two.
    private(set) var cards: [Card]
    
    init(numberOfPairs: Int, contentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs{
            cards.append(Card(id:"\(pairIndex+1)a", content:contentFactory(pairIndex)))
            cards.append(Card(id:"\(pairIndex+1)b", content:contentFactory(pairIndex)))
        }
    }
    mutating func choose(_ card: Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    func index(of card: Card) -> Int{
        for index in cards.indices{
            if cards[index] == card{
                return index
            }
        }
        return 0
    }
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable{
        var id: String
        var content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false
    }
                     
}
