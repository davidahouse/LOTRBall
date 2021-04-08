//
//  Player.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import Combine
import Foundation

struct Player {
    let name: String
    let occupation: String
    let race: String
}

extension Player {

    var justPublisher: AnyPublisher<Player, Never> {
        Just(self).eraseToAnyPublisher()
    }
}

#if DEBUG
extension Player {
    static let somePlayer = Player(name: "APlayer", occupation: "player", race: "only if chased")
}
#endif
