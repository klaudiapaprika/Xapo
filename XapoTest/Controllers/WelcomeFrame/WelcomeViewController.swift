//
//  ViewController.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import UIKit

class WelcomeViewController: UIViewController, StoryboardLoadable, BindableType {
    var viewModel: WelcomeViewModel!
    var welcomeContentView: WelcomeConentViewController!

    @IBOutlet private weak var goTo: UILabel!
    @IBOutlet private weak var welcomeContentContainer: UIView!
    @IBOutlet private weak var termsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        //
        viewModel.fetchWelcome { model in
            self.viewModel.model = model
        }
    }

    private func prepareView() {

        self.navigationController?.isNavigationBarHidden = true
        let welcomeContentViewController = WelcomeConentViewController.instantiate()
        addChild(childVC: welcomeContentViewController, welcomeContentContainer)
        self.welcomeContentView = welcomeContentViewController
        guard let viewModel = viewModel else {
            return
        }
        termsLabel.attributedText = viewModel.attributedTerms
    }
}
