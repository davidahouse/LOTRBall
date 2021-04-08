//
//  ActionBarView.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import SwiftUI

struct ActionBarView: View {

    @EnvironmentObject var viewModel: ActionBarViewModel

    var body: some View {
        Button("Swing", action: {
            viewModel.swing()
        })
    }
}

struct ActionBarView_Previews: PreviewProvider {
    static var previews: some View {
        ActionBarView()
    }
}
