//
//  BowlingTests.swift
//  BowlingTests
//
//  Created by Mihai Cristescu on 25/11/2018.
//  Copyright © 2018 Mihai Cristescu. All rights reserved.
//

import XCTest
@testable import Bowling

class BowlingTests: XCTestCase {

    private var game: Game!

    override func setUp() {
        game = Game()
    }

    func test_gutter_game() {
        rollMany(times: 20, pins: 0)
        XCTAssertEqual(0, game.score())
    }

    func test_all_ones() {
        rollMany(times: 20, pins: 1)
        XCTAssertEqual(20, game.score())
    }

    func test_one_spare() {
        rollSpare()
        game.roll(3)
        rollMany(times: 17, pins: 0)
        XCTAssertEqual(16, game.score())
    }

    func test_one_strikee() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(times: 16, pins: 0)
        XCTAssertEqual(24, game.score())
    }

    func teste_perfect_game() {
        rollMany(times: 12, pins: 10)
        XCTAssertEqual(300, game.score())
    }

    private func rollMany(times: Int, pins: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }

    private func rollSpare() {
        game.roll(5)
        game.roll(5)
    }

    private func rollStrike() {
        game.roll(10)
    }

}
