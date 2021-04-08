//
//  PlayingFieldView.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import SwiftUI

struct PlayingFieldView: View {

    @EnvironmentObject var viewModel: PlayingFieldViewModel

    var body: some View {
        ZStack {
            Color.green

            GeometryReader { reader in

                // Home
                Rectangle()
                    .stroke(Color.black, lineWidth: 2.0)
                    .frame(width: 50, height: 50)
                    .offset(x: (reader.size.width / 2.0) - 25, y: reader.size.height - 50)

                // First
                if let player = viewModel.onFirst {
                    ZStack {
                        occupiedBase
                        Text(player)
                    }
                    .frame(width: 50, height: 50)
                    .offset(x: reader.size.width - 50, y: (reader.size.height / 2.0) - 25)

                } else {
                    emptyBase
                        .frame(width: 50, height: 50)
                        .offset(x: reader.size.width - 50, y: (reader.size.height / 2.0) - 25)
                }

                // Second
                if let player = viewModel.onSecond {
                    ZStack {
                        occupiedBase
                            Text(player)
                    }
                        .frame(width: 50, height: 50)
                        .offset(x: (reader.size.width / 2.0) - 25, y: 0)
                } else {
                    emptyBase
                        .frame(width: 50, height: 50)
                        .offset(x: (reader.size.width / 2.0) - 25, y: 0)
                }

                // Third
                if let player = viewModel.onThird {
                    ZStack {
                        occupiedBase
                            Text(player)
                    }
                        .frame(width: 50, height: 50)
                        .offset(x: 0, y: (reader.size.height / 2.0) - 25)
                } else {
                    emptyBase
                        .frame(width: 50, height: 50)
                        .offset(x: 0, y: (reader.size.height / 2.0) - 25)

                }
            }.padding()
        }
    }

    var occupiedBase: some View {
        Circle()
            .fill(Color.red)
    }

    var emptyBase: some View {
        Circle()
            .stroke(Color.black, lineWidth: 2.0)
    }

}

struct PlayingFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingFieldView()
    }
}
