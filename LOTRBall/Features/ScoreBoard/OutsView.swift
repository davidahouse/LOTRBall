//
//  OutsView.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import SwiftUI

struct OutsView: View {

    @EnvironmentObject var viewModel: OutsViewModel
    
    var body: some View {
        HStack {
            Text("OUTS:")
                .font(.headline)
            if viewModel.outs > 0 {
                Circle()
                    .fill(Color.red)
                    .frame(width: 25, height: 25)
            }
            if viewModel.outs > 1 {
                Circle()
                    .fill(Color.red)
                    .frame(width: 25, height: 25)
            }
            if viewModel.outs > 2 {
                Circle()
                    .fill(Color.red)
                    .frame(width: 25, height: 25)
            }
        }
    }
}

struct OutsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OutsView()
                .environmentObject(OutsViewModel(outs: 0))
            OutsView()
                .environmentObject(OutsViewModel(outs: 1))
            OutsView()
                .environmentObject(OutsViewModel(outs: 2))
            OutsView()
                .environmentObject(OutsViewModel(outs: 3))
        }
    }
}
