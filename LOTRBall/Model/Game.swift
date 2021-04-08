//
//  Game.swift
//  LOTRBall
//
//  Created by David House on 4/7/21.
//

import Combine
import Foundation

enum Side {
    case light
    case dark
}

struct Game {
    let lightScore: Int
    let darkScore: Int
    let inning: Int
    let outs: Int

    let onBase: [String?]

    init(lightScore: Int, darkScore: Int, inning: Int, outs: Int, onBase: [String?]) {
        self.lightScore = lightScore
        self.darkScore = darkScore
        self.inning = inning
        self.outs = outs
        self.onBase = onBase
    }

    static func start() -> Game {
        return Game(lightScore: 0, darkScore: 0, inning: 1, outs: 0, onBase: [.none, .none, .none])
    }

}

extension Game {

    var justPublisher: AnyPublisher<Game, Never> {
        Just(self).eraseToAnyPublisher()
    }
}

#if DEBUG
extension Game {
    static let someGame = Game(lightScore: 1, darkScore: 2, inning: 3, outs: 2, onBase: ["someone", .none, .none])
}
#endif
