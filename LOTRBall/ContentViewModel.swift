//
//  ContentViewModel.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import Combine
import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {

    @Published var game: Game?

    var startGameViewModel: StartGameViewModel!
    var scoreBoardViewModel: ScoreBoardViewModel!
    var actionBarViewModel: ActionBarViewModel!
    var nowBattingViewModel: NowBattingViewModel!
    var playingFieldViewModel: PlayingFieldViewModel!

    private let events = PassthroughSubject<UIEvent, Never>()
    private var subscribers = [AnyCancellable]()
    private let rosterService = RosterService()
    private let playerInfoService = PlayerInfoFixtureService()
    private let swingResultService = SwingResultService()
    private var gameLogicService: GameLogicService!
    private var gameLogicUpdate: AnyCancellable?

    init() {
        // Subscribe to any UI Events so we can update our game state
        subscribers.append(uiEventSubscribe(publisher: events.eraseToAnyPublisher()))
        gameLogicService = GameLogicService(teamPublisher: rosterService.currentTeam.eraseToAnyPublisher(), battingPublisher: rosterService.currentBatter.eraseToAnyPublisher())

        startGameViewModel = StartGameViewModel(events: events)

        scoreBoardViewModel = ScoreBoardViewModel(gamePublisher: $game
                                                    .compactMap({ $0 })
                                                    .eraseToAnyPublisher())
        actionBarViewModel = ActionBarViewModel(events: events)
        nowBattingViewModel = NowBattingViewModel(playerPublisher: playerPublisher(), messagePublisher: messagePublisher())
        playingFieldViewModel = PlayingFieldViewModel(gamePublisher: $game
                                                        .compactMap({ $0 })
                                                        .eraseToAnyPublisher())
    }

    private func messagePublisher() -> AnyPublisher<String, Never> {
        gameLogicService.notifications
            .merge(with: rosterService.notifications)
            .eraseToAnyPublisher()
    }

    private func playerPublisher() -> AnyPublisher<Player, PlayerInfoError> {
        rosterService.currentBatter
            .flatMap { self.playerInfoService.playerInfoService(playerName: $0) }
            .eraseToAnyPublisher()
    }

    private func handleGameUpdate(_ update: GameUpdate) {

        guard update.game.outs < 3 else {
            if update.game.inning < 9 {
                game = Game(goodScore: update.game.goodScore, badScore: update.game.badScore, inning: rosterService.currentTeam.value == .bad ? update.game.inning : update.game.inning + 1, outs: 0, onBase: [.none, .none, .none, .none])
                rosterService.switchTeam()
            } else {
                // Game over!
                game = nil
            }
            return
        }

        if update.newBatter {
            rosterService.nextBatter()
        }
        game = update.game
    }
}

extension ContentViewModel: UIEventSubscriber {

    func batterSwing() {
        guard let game = game else {
            return
        }

        self.gameLogicUpdate = swingResultService.swingPublisher()
            .receive(on: DispatchQueue.main)
            .flatMap { self.gameLogicService.update(game: game, swingResult: $0) }
            .sink { [weak self] update in
                self?.handleGameUpdate(update)
            }

        // Without the extension:
//        swingResultService.swingResult(onCompletion: { result in
//            self.gameLogicUpdate = gameLogicService.update(game: game, swingResult: result)
//                .receive(on: DispatchQueue.main)
//                .sink { [weak self] update in
//                    self?.handleGameUpdate(update)
//                }
//        })
    }

    func newGame() {
        rosterService.reset()
        game = Game.start()
    }
}
