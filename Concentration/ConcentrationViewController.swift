//
//  ViewController.swift
//  Concentration
//
//  Created by Shayne Kelly II on 2018-12-28.
//  Copyright © 2018 Shayne Kelly II. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    lazy var game = Concentration(numberOfCardPairs: (cardButtons.count + 1) / 2)
    var emojiChoices = ["😂", "😭", "☺️", "😜", "😤", "😔", "😀", "😩", "😇", "😘", "🤪", "😱"]
    var cardEmojis = [Int:String]()
    var flipCount = 0 { didSet { flipLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let buttonIndex = cardButtons.index(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for (i, cardButton) in cardButtons.enumerated() {
            let card = game.cards[i]
            cardButton.setTitle(card.isFaceUp ? getCardEmoji(for: card) : "", for: UIControl.State.normal)
            if (card.isFaceUp) {
                cardButton.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            } else {
                cardButton.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }
            
        }
    }
    
    func getCardEmoji(for card: Card) -> String {
        if cardEmojis[card.uuid] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            cardEmojis[card.uuid] = emojiChoices.remove(at: randomIndex)
        }
        return cardEmojis[card.uuid] ?? "?"
    }
}
