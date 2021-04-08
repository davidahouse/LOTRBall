//
//  RosterService.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation

class RosterService {

    var currentBatter: AnyPublisher<String, Never> {
        batter.eraseToAnyPublisher()
    }

    var currentTeam: AnyPublisher<Team, Never> {
        team.eraseToAnyPublisher()
    }

    // MARK: - Private properties

    private var batter = CurrentValueSubject<String, Never>(DarkTeamRoster.saruman.name)
    private var team = CurrentValueSubject<Team, Never>(.dark)

    private var lightTeamBatter = LightTeamRoster.gandalf
    private var darkTeamBatter = DarkTeamRoster.saruman

    // MARK: - Public methods

    func nextBatter() {
        switch team.value {
        case .light:
            let lightBatter = lightTeamBatter.next()
            batter.value = lightBatter.name
            lightTeamBatter = lightBatter
        case .dark:
            let darkBatter = darkTeamBatter.next()
            batter.value = darkBatter.name
            darkTeamBatter = darkBatter
        }
    }

    func switchTeam() {
        switch team.value {
        case .light:
            team.value = .dark
        case .dark:
            team.value = .light
        }
        nextBatter()
    }

    func reset() {
        lightTeamBatter = .gandalf
        darkTeamBatter = .saruman
        batter.value = darkTeamBatter.name
        team.value = .dark
    }
}
