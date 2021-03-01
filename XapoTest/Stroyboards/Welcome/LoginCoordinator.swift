//
//  LoginCordinator.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import XCoordinator
import Swinject

enum LoginRoute: Route {
    case welcome
}

class LoginCoordinator: NavigationCoordinator<LoginRoute> {
    // MARK: Initialization
    let container: Swinject.Container

    convenience init?() {
        guard let container = APPDELEGATE?.container else {
            return nil
        }
        self.init(container: container)
    }

    private init(container:Swinject.Container) {
        self.container = container
        super.init(initialRoute: .welcome)
    }

    // MARK: Overrides
    override func prepareTransition(for route: LoginRoute) -> NavigationTransition {
        setUpRouterDependency(route)
        switch route {
        case .welcome:
            let viewController = WelcomeViewController.instantiate()
            let viewModel = WelcomeViewModel(router: unownedRouter)
            viewModel.model =  WelcomeModel(title: Localized.welcomeTitle, description: Localized.welcomeDescription, navigationText: Localized.goToXapo, termsAndPolicy: Localized.termsAndPolicy)
            viewController.bind(to: viewModel)
            // viewController.navigationController?.setNavigationBarTransparent()
            return .push(viewController)
        }
    }

    func setUpRouterDependency(_ route: LoginRoute) {
        container.register(LoginRoute.self, factory: {_ in
            route
        })

        container.register(UnownedRouter<LoginRoute>.self) { _ in
            self.unownedRouter
        }
    }
}
