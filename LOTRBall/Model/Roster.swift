//
//  Roster.swift
//  LOTRBall
//
//  Created by David House on 4/7/21.
//

import Foundation

enum Team {
    case good
    case bad
}

enum GoodTeamRoster: String, CaseIterable {
    case gandalf = "Gandalf"
    case aragorn = "Aragorn"
    case frodo = "Frodo"
    case gimli = "Gimli"
    case legolas = "Legolas"
    case boromir = "Boromir"
    case sam = "Sam"
    case pippin = "Pippin"
    case merry = "Merry"

    var name: String {
        return rawValue
    }

    func next() -> GoodTeamRoster {
        guard self != .merry, let index = GoodTeamRoster.allCases.firstIndex(of: self) else {
            return .gandalf
        }

        return GoodTeamRoster.allCases[index+1]
    }
}

enum BadTeamRoster: String, CaseIterable {
    case saruman = "Saruman"
    case sauron = "Sauron"
    case gothmog = "Gothmog"
    case wormtounge = "Wormtongue"
    case gollum = "Gollum"
    case smaug = "Smaug"
    case witchKing = "Witch King"
    case shelob = "Shelob"
    case balrog = "Balrog"

    var name: String {
        return rawValue
    }

    func next() -> BadTeamRoster {
        guard self != .balrog, let index = BadTeamRoster.allCases.firstIndex(of: self) else {
            return .saruman
        }

        return BadTeamRoster.allCases[index+1]
    }
}
