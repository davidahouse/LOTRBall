//
//  Roster.swift
//  LOTRBall
//
//  Created by David House on 4/7/21.
//

import Foundation

enum Team {
    case light
    case dark
}

enum LightTeamRoster: String, CaseIterable {
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

    func next() -> LightTeamRoster {
        guard self != .merry, let index = LightTeamRoster.allCases.firstIndex(of: self) else {
            return .gandalf
        }

        return LightTeamRoster.allCases[index+1]
    }
}

enum DarkTeamRoster: String, CaseIterable {
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

    func next() -> DarkTeamRoster {
        guard self != .balrog, let index = DarkTeamRoster.allCases.firstIndex(of: self) else {
            return .saruman
        }

        return DarkTeamRoster.allCases[index+1]
    }
}
