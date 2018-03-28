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
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "FLIPS: \(flipCount)"
        }
    }
    
    let emojiSelections = ["👍🏼", "👏🏼", "👍🏼", "👏🏼"]
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    // MARK: - IBAction Methods
    
    @IBAction func touchCardDidTouch(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiSelections[cardNumber], on: sender)
        }
        else {
            print("Card is not found...")
        }
        
    }
    
    // MARK: - Helper Methods
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.white
        }
    }
}

