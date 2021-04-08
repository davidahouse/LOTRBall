//
//  RosterService.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation

class RosterService {

    private(set) var currentBatter = CurrentValueSubject<String, Never>(DarkTeamRoster.saruman.name)
    private(set) var currentTeam = CurrentValueSubject<Team, Never>(.dark)
    private(set) var notifications = PassthroughSubject<String, Never>()

    // MARK: - Private properties

    private var lightTeamBatter = LightTeamRoster.gandalf
    private var darkTeamBatter = DarkTeamRoster.saruman

    // MARK: - Public methods

    func nextBatter() {
        switch currentTeam.value {
        case .light:
            let lightBatter = lightTeamBatter.next()
            currentBatter.value = lightBatter.name
            lightTeamBatter = lightBatter
            notifications.send("Now batting.... \(lightBatter.name)")
        case .dark:
            let darkBatter = darkTeamBatter.next()
            currentBatter.value = darkBatter.name
            darkTeamBatter = darkBatter
            notifications.send("Now batting.... \(darkBatter.name)")
        }
    }

    func switchTeam() {
        switch currentTeam.value {
        case .light:
            currentTeam.value = .dark
        case .dark:
            currentTeam.value = .light
        }
        nextBatter()
    }

    func reset() {
        lightTeamBatter = .gandalf
        darkTeamBatter = .saruman
        currentBatter.value = darkTeamBatter.name
        currentTeam.value = .dark
    }
}
