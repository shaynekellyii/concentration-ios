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
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        flipLabel.text = "Flips: \(flipCount)"
    }
}

