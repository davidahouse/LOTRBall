//
//  GameLogicService.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation

struct GameUpdate {
    let game: Game
    let newBatter: Bool
}

class GameLogicService {

    private var team: Team = .bad
    private var batting: String = ""
    private var subscribers = [AnyCancellable]()
    private(set) var notifications = PassthroughSubject<String, Never>()

    init(teamPublisher: AnyPublisher<Team, Never>, battingPublisher: AnyPublisher<String, Never>) {

        teamPublisher
            .weakAssign(to: \.team, on: self)
            .store(in: &subscribers)
        battingPublisher
            .weakAssign(to: \.batting, on: self)
            .store(in: &subscribers)
    }

    func update(game: Game, swingResult: SwingResult) -> AnyPublisher<GameUpdate, Never> {

        print("\(batting) \(swingResult.description)")
        notifications.send("\(batting) \(swingResult.description)")

        guard swingResult != .out else {
            return Just(GameUpdate(game: Game(goodScore: game.goodScore, badScore: game.badScore, inning: game.inning, outs: game.outs + 1, onBase: game.onBase), newBatter: true))
                .eraseToAnyPublisher()
        }

        var scores = 0
        var bases = game.onBase
        for index in 1...swingResult.bases {
            let last = bases.removeLast()
            if last != nil {
                scores += 1
            }

            if index == 1 {
                bases.insert(batting, at: 0)
            } else {
                bases.insert(.none, at: 0)
            }
        }

        let updatedGame: Game = {
            switch team {
            case .good:
                return Game(goodScore: game.goodScore + scores, badScore: game.badScore, inning: game.inning, outs: game.outs, onBase: bases)
            case .bad:
                return Game(goodScore: game.goodScore, badScore: game.badScore + scores, inning: game.inning, outs: game.outs, onBase: bases)
            }
        }()

        return Just(GameUpdate(game: updatedGame, newBatter: true))
            .eraseToAnyPublisher()
    }
}
