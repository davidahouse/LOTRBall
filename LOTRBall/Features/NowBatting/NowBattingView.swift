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
                    .font(.title)
                    .bold()
                Divider()
                Spacer()
                Text("Occupation:")
                    .font(.caption)
                Text(viewModel.playerOccupation)
                    .font(.body)
                    .bold()
                Text("Race:")
                    .font(.caption)
                Text(viewModel.playerRace)
                    .font(.body)
                    .bold()
                Spacer()
                Divider()
                ForEach(viewModel.messages, id: \.self) { msg in
                    Text(msg)
                }
            }
        }
    }
}

struct NowBattingView_Previews: PreviewProvider {
    static var previews: some View {
        NowBattingView()
    }
}
