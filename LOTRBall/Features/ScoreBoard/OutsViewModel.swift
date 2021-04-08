//
//  OutsViewModel.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation
import SwiftUI

class OutsViewModel: ObservableObject {
    
    @Published private(set) var outs: Int = 0

    init(outs: Int) {
        self.outs = outs
    }

    func set(outs: Int) {
        self.outs = outs
    }
}
