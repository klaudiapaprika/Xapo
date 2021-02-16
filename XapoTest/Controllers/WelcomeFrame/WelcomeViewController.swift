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
    
    @IBOutlet weak var goTo: UILabel!
    @IBOutlet weak var welcomeContentContainer: UIView!
    @IBOutlet weak var termsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        //
        viewModel.fetchWelcome { model in
            self.viewModel.model = model
        }
    }
    
    private func prepareView() {
        let welcomeContentViewController = WelcomeConentViewController.instantiate()
        addChild(childVC: welcomeContentViewController, welcomeContentContainer)
        self.welcomeContentView = welcomeContentViewController
        guard let viewModel = viewModel else {
            return
        }
        termsLabel.attributedText = viewModel.attributedTerms
    }
}
