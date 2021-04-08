//
//  StartGame.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import SwiftUI

struct StartGame: View {

    @EnvironmentObject var viewModel: StartGameViewModel

    var body: some View {
        ZStack {
            Color.white
            Image("FieldBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text("Click to sports ball for middle earth")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.startGame()
        }
    }
}

struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        StartGame()
    }
}
