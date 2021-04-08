//
//  GameLogicServiceTests.swift
//  LOTRBallTests
//
//  Created by David House on 4/8/21.
//

import Combine
@testable import LOTRBall
import XCTest

class GameLogicServiceTests: XCTestCase {

    var subscribers = [AnyCancellable]()

    func testSingleWithNoPlayersOnBaseResultsInBatterOnFirst() {
        let receivedUpdate = expectation(description: "received our game update")

        let service = GameLogicService(teamPublisher: Just(.dark).eraseToAnyPublisher(), battingPublisher: Just("Saruman").eraseToAnyPublisher())
        let game = Game(lightScore: 0, darkScore: 0, inning: 1, outs: 0, onBase: [.none, .none, .none])
        service.update(game: game, swingResult: .single)
            .sink { updated in
                XCTAssertEqual(updated.game.darkScore, 0)
                XCTAssertEqual(updated.game.onBase, ["Saruman", .none, .none, .none])
                receivedUpdate.fulfill()
            }
            .store(in: &subscribers)

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testDoubleWithPlayerOnSecondResultsInScoreAndBatterOnSecond() {
        let receivedUpdate = expectation(description: "received our game update")

        let service = GameLogicService(teamPublisher: Just(.dark).eraseToAnyPublisher(), battingPublisher: Just("Sauron").eraseToAnyPublisher())
        let game = Game(lightScore: 0, darkScore: 0, inning: 1, outs: 0, onBase: [.none, "Saruman", .none])
        service.update(game: game, swingResult: .double)
            .sink { updated in
                XCTAssertEqual(updated.game.darkScore, 1)
                XCTAssertEqual(updated.game.onBase, [.none, "Sauron", .none])
                receivedUpdate.fulfill()
            }
            .store(in: &subscribers)

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testHomeRunWithPlayerOnSecondResultsTwoScoresAndEmptyBases() {
        let receivedUpdate = expectation(description: "received our game update")

        let service = GameLogicService(teamPublisher: Just(.dark).eraseToAnyPublisher(), battingPublisher: Just("Sauron").eraseToAnyPublisher())
        let game = Game(lightScore: 0, darkScore: 0, inning: 1, outs: 0, onBase: [.none, "Saruman", .none])
        service.update(game: game, swingResult: .homeRun)
            .sink { updated in
                XCTAssertEqual(updated.game.darkScore, 2)
                XCTAssertEqual(updated.game.onBase, [.none, .none, .none])
                receivedUpdate.fulfill()
            }
            .store(in: &subscribers)

        waitForExpectations(timeout: 1, handler: nil)
    }
}
