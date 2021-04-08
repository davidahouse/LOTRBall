//
//  NowBattingView.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import SwiftUI

struct NowBattingView: View {

    @EnvironmentObject var viewModel: NowBattingViewModel

    var body: some View {
        if viewModel.errorFindingPlayer {
            Text("ERROR!")
        } else {
            VStack {
                Text(viewModel.playerName)
                Divider()
                Text("Occupation:")
                Text(viewModel.playerOccupation)
                Text("Race:")
                Text(viewModel.playerRace)
                Divider()
            }
        }
    }
}

struct NowBattingView_Previews: PreviewProvider {
    static var previews: some View {
        NowBattingView()
    }
}
