//
//  Utilities.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import Foundation
import UIKit

// MARK: - Appdelegate singleton
weak var APPDELEGATE: AppDelegate? {
    return UIApplication.shared.delegate as? AppDelegate
}

// MARK: - UIViewController extensions
extension UIViewController {
   func addChild(childVC: UIViewController, _ view: UIView) {
      self.addChild(childVC)
      childVC.view.frame = view.bounds
      view.addSubview(childVC.view)
      childVC.didMove(toParent: self)
   }
}

// MARK: - String extensions
extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

extension UINavigationController {
    func setNavigationBarTransparent() {
        // Make the navigation bar background clear
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationItem.leftItemsSupplementBackButton = true
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }

    func setNavigationBarDefault() {
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
}
