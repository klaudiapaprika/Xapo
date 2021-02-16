//
//  StoryBoardLodable.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import Foundation
import UIKit

protocol StoryboardLoadable: AnyObject {
    static var storyboardName: String { get }
}

extension StoryboardLoadable where Self: UIViewController {
    static var storyboardName: String {
        "Main"
    }
}
