//
//  Card.swift
//  Concentration
//
//  Created by Shayne Kelly II on 2018-12-28.
//  Copyright © 2018 Shayne Kelly II. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var uuid: Int
    static var currentUuid = 0
    
    init() {
        self.uuid = Card.getUuid()
    }
    
    static func getUuid() -> Int {
        currentUuid += 1
        return currentUuid
    }
    
}
