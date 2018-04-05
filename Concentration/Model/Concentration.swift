//
//  Concentration.swift
//  Concentration
//
//  Created by Yohannes Wijaya on 3/28/18.
//  Copyright © 2018 Corruption of Conformity. All rights reserved.
//

import Foundation

class Concentration {
    
    // MARK: - Properties
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // MARK: - Methods

    func chooseCard(at index: Int) {
        // 3 options:
        // 1) no card is face up, then when any card is touched, just flip the touched one over to face up.
        // 2) both cards are face up. Then when other unopened card is touched, both of those cards need to face down (no match) or "disappear" (matched)
        // 3) 1 card is face up and I need to match it when another card is opened.
        if !cards[index].isMatched {
            if let validMatchedIndex = indexOfOneAndOnlyFaceUpCard, validMatchedIndex != index {
                // check if card match
                if cards[validMatchedIndex].identifier == cards[index].identifier {
                    cards[validMatchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // MARK: - Initializers
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: - Shuffle the cards as homework
    }
}
