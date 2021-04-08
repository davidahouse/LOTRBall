//
//  SwingResultService.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation

class SwingResultService {

    func swingResult(onCompletion: (SwingResult) -> Void) {
        onCompletion(SwingResult.allCases.randomElement()!)
    }
}

extension SwingResultService {

    func swingPublisher() -> AnyPublisher<SwingResult, Never> {
        return AnyPublisher<SwingResult, Never>(Future<SwingResult, Never> { promise in
            self.swingResult { result in
                promise(.success(result))
            }
        })
    }
}
