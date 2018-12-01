//
//  Game.swift
//  Bowling
//
//  Created by Mihai Cristescu on 25/11/2018.
//  Copyright © 2018 Mihai Cristescu. All rights reserved.
//

import Foundation

public class Game {

    private var rolls: [Int] = Array(repeating: 0, count: 21)
    private var currentRoll = 0
    private var scoreCount: Int = 0

    public func roll(_ pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }

    public func score() -> Int {

        var firstInFrame = 0
        for _ in 1...10 {
            if isStrike(firstInFrame) { // strike
                scoreCount += (10 + nextTwoBallsForStrike(firstInFrame))
                firstInFrame += 1
            } else if isSpare(firstInFrame) {
                scoreCount += (10 + nextBallForSpare(firstInFrame))
                firstInFrame += 2
            } else {
                scoreCount += twoBallsInFrame(firstInFrame)
                firstInFrame += 2
            }
        }
        return scoreCount
    }

    private func isSpare(_ firstInFrame: Int) -> Bool {
        return rolls[firstInFrame] + rolls[firstInFrame+1] == 10
    }

    private func isStrike(_ firstInFrame: Int) -> Bool {
        return rolls[firstInFrame] == 10
    }

    private func nextTwoBallsForStrike(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame+1] + rolls[firstInFrame+2]
    }

    private func nextBallForSpare(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame+2]
    }

    private func twoBallsInFrame(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame] + rolls[firstInFrame+1]
    }
}
