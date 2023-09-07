//
//  Game.swift
//  Bullseye
//
//  Created by Jan Armbrust on 17.08.23.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let closeToPerfectRange = (target - 2)...(target + 2)
        if (sliderValue == target) {
            return 100 - abs(sliderValue - target) + 100
        } else if (closeToPerfectRange.contains(sliderValue)) {
            return 100 - abs(sliderValue - target) + 50
        } else {
            return 100 - abs(sliderValue - target)
        }
    }
    
    mutating func startNewRound(points: Int) {
        score = score + points
        round = round + 1
        target = Int.random(in: 1...100)
    }
}
