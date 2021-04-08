//
//  Publisher+Extension.swift
//  LOTRBall
//
//  Created by David House on 4/8/21.
//

import Combine
import Foundation

extension Publisher where Failure == Never {
    func weakAssign<T: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<T, Output>,
        on object: T
    ) -> AnyCancellable {
        sink { [weak object] value in
            object?[keyPath: keyPath] = value
        }
    }
}
