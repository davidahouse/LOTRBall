//
//  SwingResult.swift
//  LOTRBall
//
//  Created by David House on 4/7/21.
//

import Foundation

enum SwingResult: CaseIterable {
    case out
    case single
    case double
    case triple
    case homeRun

    var bases: Int {
        switch self {
        case .out:
            return 0
        case .single:
            return 1
        case .double:
            return 2
        case .triple:
            return 3
        case .homeRun:
            return 4
        }
    }

    var description: String {
        switch self {
        case .out:
            return "is out!!"
        case .single:
            return "hit a single"
        case .double:
            return "hit a double"
        case .triple:
            return "hit a triple"
        case .homeRun:
            return "knocked it out of the park!"
        }
    }
}
