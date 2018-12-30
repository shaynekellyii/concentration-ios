//
//  Concentration.swift
//  Concentration
//
//  Created by Shayne Kelly II on 2018-12-28.
//  Copyright © 2018 Shayne Kelly II. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfFaceUpCard: Int?
    
    init(numberOfCardPairs: Int) {
        for _ in 0..<numberOfCardPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if (cards[index].isMatched) {
            return
        }
        
        if indexOfFaceUpCard != nil { // when one card is flipped
            cards[index].isFaceUp = true
            if (cards[index].uuid == cards[indexOfFaceUpCard!].uuid) {
                cards[index].isMatched = true
                cards[indexOfFaceUpCard!].isMatched = true
            }
            indexOfFaceUpCard = nil
        } else { // when two cards are flipped or none
            for i in cards.indices {
                cards[i].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfFaceUpCard = index
        }
    }
    
    
}
