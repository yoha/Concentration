//
//  Card.swift
//  Concentration
//
//  Created by Yohannes Wijaya on 3/28/18.
//  Copyright © 2018 Corruption of Conformity. All rights reserved.
//

import Foundation

struct Card {
    
    // MARK: - Properties
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierOrigin = 0
    
    // MARK: - Methods
    
    static func getUniqueIdentifier() -> Int {
        identifierOrigin += 1
        return identifierOrigin
    }

    // MARK: - Initializers
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
