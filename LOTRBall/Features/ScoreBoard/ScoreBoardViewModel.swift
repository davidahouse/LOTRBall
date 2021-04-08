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
    @Published private(set) var goodScore: Int = 0
    @Published private(set) var badScore: Int = 0
    @Published private(set) var inning: Int = 1
    @Published private(set) var outsViewModel = OutsViewModel(outs: 0)

    // MARK: - Private Properties

    var subscribers = [AnyCancellable]()

    // MARK: - Initializer
    init(gamePublisher: AnyPublisher<Game, Never>) {
        gamePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] game in
                self?.goodScore = game.goodScore
                self?.badScore = game.badScore
                self?.inning = game.inning
                self?.outsViewModel.set(outs: game.outs)
            }
            .store(in: &subscribers)
    }
}
