//
//  Utilities.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import Foundation
import UIKit

//MARK: - Appdelegate singleton
weak var APPDELEGATE: AppDelegate? {
    return UIApplication.shared.delegate as? AppDelegate
}

//MARK: - UIViewController extensions
extension UIViewController {
   func addChild(childVC: UIViewController, _ view: UIView) {
      self.addChild(childVC)
      childVC.view.frame = view.bounds
      view.addSubview(childVC.view)
      childVC.didMove(toParent: self)
   }
}

//MARK: - String extensions
extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
