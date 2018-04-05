//
//  ViewController.swift
//  Concentration
//
//  Created by Yohannes Wijaya on 3/15/18.
//  Copyright © 2018 Corruption of Conformity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "FLIPS: \(flipCount)"
        }
    }
    
    var emojiCharacters = ["👏🏼", "😈", "🎓", "💼", "🎮", "💻", "⌚️", "🖥" ]
    var emojiChoices = [Int: String]()
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    // MARK: - IBAction Methods
    
    @IBAction func touchCardDidTouch(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("Chosen card is not found in the cardButtons")
        }
        
    }
    
    // MARK: - Helper Methods
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let cardButton = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                cardButton.setTitle(returnEmojiChoice(for: card), for: .normal)
                cardButton.backgroundColor = .white
            }
            else {
                cardButton.setTitle("", for: .normal)
                cardButton.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func returnEmojiChoice(for card: Card) -> String {
        if emojiChoices[card.identifier] == nil, emojiCharacters.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCharacters.count)))
            emojiChoices[card.identifier] = emojiCharacters.remove(at: randomIndex)
        }
        return emojiChoices[card.identifier] ?? "?"
    }
}

