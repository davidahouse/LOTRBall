//
//  ContentView.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        ZStack {
            Color.clear
            if viewModel.game != nil {
                VStack {
                    ScoreBoardView()
                        .environmentObject(viewModel.scoreBoardViewModel)
                        .frame(height: 50)
                    Spacer()
                    HStack {
                        PlayingFieldView()
                            .environmentObject(viewModel.playingFieldViewModel)
                        NowBattingView()
                            .environmentObject(viewModel.nowBattingViewModel)
                            .frame(width: 250)
                    }
                    Spacer()
                    ActionBarView()
                        .environmentObject(viewModel.actionBarViewModel)
                        .frame(height: 50)
                }
            } else {
                StartGame()
                    .environmentObject(viewModel.startGameViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
