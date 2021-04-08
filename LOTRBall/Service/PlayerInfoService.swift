//
//  PlayerInfoService.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import Combine
import Foundation

enum PlayerInfoError: Error {
    case playerNotFound
}

protocol PlayerInfoService {
    func playerInfoService(playerName: String) -> AnyPublisher<Player, PlayerInfoError>
}

class PlayerInfoFixtureService: PlayerInfoService {

    static let details: [String: Player] = [
        "Gandalf": Player(name: "Gandalf", occupation: "Wizard", race: "Ainur"),
        "Aragorn": Player(name: "Aragorn", occupation: "King of Gondor", race: "Men"),
        "Frodo": Player(name: "Frodo", occupation: "Ring Bearer", race: "Hobbit"),
        "Gimli": Player(name: "Gimli", occupation: "Explorer", race: "Dwarf"),
        "Legolas": Player(name: "Legolas", occupation: "Explorer", race: "Elf"),
        "Boromir": Player(name: "Boromir", occupation: "Steward of Gondor", race: "Men"),
        "Sam": Player(name: "Sam", occupation: "Gardener", race: "Hobbit"),
        "Pippin": Player(name: "Pippin", occupation: "Troublemaker", race: "Hobbit"),
        "Merry": Player(name: "Merry", occupation: "Troublemaker", race: "Hobbit"),
        "Saruman": Player(name: "Saruman", occupation: "Wizard", race: "Ainur"),
        "Sauron": Player(name: "Sauron", occupation: "Bad Guy", race: "Ainur"),
        "Gothmog": Player(name: "Gothmog", occupation: "Lt of Morgul", race: "Unknown"),
        "Wormtongue": Player(name: "Wormtongue", occupation: "Advisor", race: "Men"),
        "Gollum": Player(name: "Gollum", occupation: "My precious", race: "Men"),
        "Smaug": Player(name: "Smaug", occupation: "Hoarder", race: "Dragon"),
        "Witch King": Player(name: "Witch King", occupation: "Witch-king of Angmar", race: "Men"),
        "Shelob": Player(name: "Shelob", occupation: "Collector", race: "Spider"),
        "Balrog": Player(name: "Balrog", occupation: "Balrogger", race: "Maiar")
    ]

    func playerInfoService(playerName: String) -> AnyPublisher<Player, PlayerInfoError> {
        if let player = PlayerInfoFixtureService.details[playerName] {
            return Just(player)
                .setFailureType(to: PlayerInfoError.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: PlayerInfoError.playerNotFound).eraseToAnyPublisher()
        }
    }
}
