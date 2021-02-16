//
//  WelcomeViewModel.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 13..
//

import UIKit
import Moya
import XCoordinator
import Foundation

class WelcomeViewModel {
    var model: WelcomeModel!
    private let dataManager: DataManager

    var attributedTerms: NSMutableAttributedString {
        let attributedTerms = NSMutableAttributedString(string: model.termsAndPolicy)
        let length = attributedTerms.length
        let allRang = NSRange(location: 0, length: length)
        
        if let font = UIFont(font: Fonts.Fabriga.regular, size: 17) {
            attributedTerms.addAttribute(.font, value: font, range: allRang)
        }
        
        attributedTerms.addAttribute(.foregroundColor, value: UIColor.white.withAlphaComponent(0.75), range: allRang)
        attributedTerms.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: 14))
        
        
        var highlightedWords = ["Privacy policy", "Terms of use"]
        
        repeat {
            
            if let highlightedWord = highlightedWords.popLast() {
                let textRange = (model.termsAndPolicy as NSString).range(of: highlightedWord)
                attributedTerms.addAttribute(.underlineStyle, value:  NSUnderlineStyle.single.rawValue, range: textRange)
            }
        } while highlightedWords.isEmpty
        
        return attributedTerms
    }
    
    private let router: UnownedRouter<LoginRoute>
    
    init(router: UnownedRouter<LoginRoute>, dataManager: DataManager = .shared) {
        self.router = router
        self.dataManager = dataManager
    }
        
    func fetchWelcome(_ completion: @escaping (WelcomeModel?)->()) {
        dataManager.fetchData(.welcome, type: WelcomeModel.self, completion:{ result in
            switch result{
            case .success(let welcomeModel):
                completion(welcomeModel)
            case .failure:
                completion(nil)
            }
        })
    }
}
