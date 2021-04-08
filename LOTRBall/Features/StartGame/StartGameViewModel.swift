//
//  StartGameViewModel.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation

class StartGameViewModel: ObservableObject {

    private var events: PassthroughSubject<UIEvent, Never>

    init(events: PassthroughSubject<UIEvent, Never>) {
        self.events = events
    }

    func startGame() {
        events.send(.newGame)
    }
}
