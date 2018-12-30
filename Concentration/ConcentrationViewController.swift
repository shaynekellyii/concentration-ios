//
//  ViewController.swift
//  Concentration
//
//  Created by Shayne Kelly II on 2018-12-28.
//  Copyright © 2018 Shayne Kelly II. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    var flipCount = 0
    var game = Concentration(numberOfCardPairs: 6)
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        flipLabel.text = "Flips: \(flipCount)"
        if let buttonIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for (i, cardButton) in cardButtons.enumerated() {
            let card = game.cards[i]
            cardButton.setTitle(card.isFaceUp ? "?" : "", for: UIControl.State.normal)
            cardButton.backgroundColor = card.isFaceUp ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
    }
}
