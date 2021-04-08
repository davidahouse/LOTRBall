//
//  ScoreBoardView.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import SwiftUI

struct ScoreBoardView: View {

    @EnvironmentObject var viewModel: ScoreBoardViewModel

    var body: some View {
        HStack {
            Text("GOOD")
                .font(.headline)
            Text("\(viewModel.goodScore)")
                .font(.title)
                .bold()
            Text("BAD")
                .font(.headline)
            Text("\(viewModel.badScore)")
                .font(.title)
                .bold()
            Text("INNING")
                .font(.headline)
            Text("\(viewModel.inning)")
                .font(.title)
                .bold()
            OutsView()
                .environmentObject(viewModel.outsViewModel)
                .frame(width: 150)
        }
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
    }
}
