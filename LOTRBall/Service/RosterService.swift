//
//  RosterService.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation

class RosterService {

    private(set) var currentBatter = CurrentValueSubject<String, Never>(BadTeamRoster.saruman.name)
    private(set) var currentTeam = CurrentValueSubject<Team, Never>(.bad)
    private(set) var notifications = PassthroughSubject<String, Never>()

    // MARK: - Private properties

    private var goodTeamBatter = GoodTeamRoster.gandalf
    private var badTeamBatter = BadTeamRoster.saruman

    // MARK: - Public methods

    func nextBatter() {
        switch currentTeam.value {
        case .good:
            let batter = goodTeamBatter.next()
            currentBatter.value = batter.name
            goodTeamBatter = batter
            notifications.send("Now batting.... \(batter.name)")
        case .bad:
            let batter = badTeamBatter.next()
            currentBatter.value = batter.name
            badTeamBatter = batter
            notifications.send("Now batting.... \(batter.name)")
        }
    }

    func switchTeam() {
        switch currentTeam.value {
        case .good:
            currentTeam.value = .bad
        case .bad:
            currentTeam.value = .good
        }
        nextBatter()
    }

    func reset() {
        goodTeamBatter = .gandalf
        badTeamBatter = .saruman
        currentBatter.value = badTeamBatter.name
        currentTeam.value = .bad
    }
}
