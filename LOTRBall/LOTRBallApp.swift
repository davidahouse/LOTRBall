//
//  LOTRBallApp.swift
//  LOTRBall
//
//  Created by David House on 4/6/21.
//

import SwiftUI

@main
struct LOTRBallApp: App {

    @State var viewModel = ContentViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
