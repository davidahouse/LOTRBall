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
            Text("LIGHT")
            Text("\(viewModel.lightScore)")
            Text("DARK")
            Text("\(viewModel.darkScore)")
            Text("INNING")
            Text("\(viewModel.inning)")
            Text("OUTS")
            Text("\(viewModel.outs)")
        }
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
    }
}
