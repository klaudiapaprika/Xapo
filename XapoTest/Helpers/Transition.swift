//
//  Transition.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import UIKit
import XCoordinator

extension Transition {
    static func assertedNone(_ message: String? = nil) -> Transition {
        assertionFailure(message ?? "Transition must not be invoked")
        return Transition(presentables: [], animationInUse: nil) { _, _, completion in
            completion?()
        }
    }
}
