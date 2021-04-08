//
//  ActionBarViewModel.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import Combine
import Foundation
import SwiftUI

class ActionBarViewModel: ObservableObject {

    private var subscribers = [AnyCancellable]()
    private var events: PassthroughSubject<UIEvent, Never>

    init(playerPublisher: AnyPublisher<String, Never>,
         events: PassthroughSubject<UIEvent, Never>) {
        self.events = events
    }

    func swing() {
        events.send(.batterSwing)
    }
}
