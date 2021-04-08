//
//  NowBattingViewModel.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import Combine
import Foundation
import SwiftUI

class NowBattingViewModel: ObservableObject {

    // MARK: - Properties
    @Published private(set) var errorFindingPlayer: Bool = false
    @Published private(set) var playerName: String = ""
    @Published private(set) var playerRace: String = ""
    @Published private(set) var playerOccupation: String = ""
    @Published private(set) var messages: [String] = []

    // MARK: - Private properties

    private var subscribers = [AnyCancellable]()

    // MARK: - Initializer

    init(playerPublisher: AnyPublisher<Player, PlayerInfoError>, messagePublisher: AnyPublisher<String, Never>) {
        playerPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] error in
                self?.errorFindingPlayer = true
            }, receiveValue: { [weak self] player in
                self?.playerName = player.name
                self?.playerOccupation = player.occupation
                self?.playerRace = player.race
                self?.errorFindingPlayer = false
            })
            .store(in: &subscribers)

        messagePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                self?.messages.append(message)
                if let count = self?.messages.count, count > 6 {
                    self?.messages.removeFirst()
                }
            }
            .store(in: &subscribers)
    }
}
