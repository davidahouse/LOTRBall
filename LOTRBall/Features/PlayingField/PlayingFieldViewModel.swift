//
//  PlayingFieldViewModel.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import Combine
import Foundation
import SwiftUI

class PlayingFieldViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var onFirst: String?
    @Published private(set) var onSecond: String?
    @Published private(set) var onThird: String?

    // MARK: - Private Properties

    var subscribers = [AnyCancellable]()

    // MARK: - Initializer
    init(gamePublisher: AnyPublisher<Game, Never>) {
        gamePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] game in
                self?.onFirst = game.onBase[0]
                self?.onSecond = game.onBase[1]
                self?.onThird = game.onBase[2]
            }
            .store(in: &subscribers)
    }
}
