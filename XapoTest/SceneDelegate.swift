//
//  SceneDelegate.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController:UINavigationController?
    let container = Container()
    var rootCoordinator: LoginCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Override point for customization after application launch.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            window.makeKeyAndVisible()
        }
        rootCoordinator = LoginCoordinator()
        rootCoordinator?.strongRouter.setRoot(for: window!)
        
        rootCoordinator?.rootViewController.navigationController?.isNavigationBarHidden = true
    }
}
