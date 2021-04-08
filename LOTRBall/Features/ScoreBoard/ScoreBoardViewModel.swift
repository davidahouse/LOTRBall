//
//  ScoreBoardViewModel.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import Combine
import Foundation
import SwiftUI

class ScoreBoardViewModel: ObservableObject {
    @Published private(set) var lightScore: Int = 0
    @Published private(set) var darkScore: Int = 0
    @Published private(set) var inning: Int = 1
    @Published private(set) var outs: Int = 0

    // MARK: - Private Properties

    var subscribers = [AnyCancellable]()

    // MARK: - Initializer
    init(gamePublisher: AnyPublisher<Game, Never>) {
        gamePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] game in
                self?.lightScore = game.lightScore
                self?.darkScore = game.darkScore
                self?.inning = game.inning
                self?.outs = game.outs
            }
            .store(in: &subscribers)
    }
}
