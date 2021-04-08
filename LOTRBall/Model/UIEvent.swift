//
//  UIEvent.swift
//  LOTRBall
//
//  Created by David House on 4/7/21.
//

import Combine
import Foundation

enum UIEvent {
    case batterSwing
    case newGame
}

protocol UIEventSubscriber: class {
    func batterSwing()
    func newGame()
}

extension UIEventSubscriber {
    func batterSwing() { }
    func newGame() { }

    func uiEventSubscribe(publisher: AnyPublisher<UIEvent, Never>) -> AnyCancellable {

        publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                switch event {
                case .batterSwing:
                    self?.batterSwing()
                case .newGame:
                    self?.newGame()
                }
            }
    }
}

