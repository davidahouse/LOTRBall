//
//  Game.swift
//  LOTRBall
//
//  Created by David House on 4/7/21.
//

import Combine
import Foundation

enum Side {
    case good
    case bad
}

struct Game {
    let goodScore: Int
    let badScore: Int
    let inning: Int
    let outs: Int

    let onBase: [String?]

    init(goodScore: Int, badScore: Int, inning: Int, outs: Int, onBase: [String?]) {
        self.goodScore = goodScore
        self.badScore = badScore
        self.inning = inning
        self.outs = outs
        self.onBase = onBase
    }

    static func start() -> Game {
        return Game(goodScore: 0, badScore: 0, inning: 1, outs: 0, onBase: [.none, .none, .none])
    }

}

extension Game {

    var justPublisher: AnyPublisher<Game, Never> {
        Just(self).eraseToAnyPublisher()
    }
}

#if DEBUG
extension Game {
    static let someGame = Game(goodScore: 1, badScore: 2, inning: 3, outs: 2, onBase: ["someone", .none, .none])
}
#endif
