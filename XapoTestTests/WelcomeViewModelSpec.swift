//
//  WelcomeViewModelSpec.swift
//  XapoTestTests
//
//  Created by Klaudia Paprika on 2021. 02. 15..
//
import Quick
import Nimble
import Swinject

@testable import XapoTest

class WelcomeViewModelSpec: QuickSpec {
    
    override func spec() {
        super.spec()
        
        var welcomeViewModel: WelcomeViewModel!
        let mockNetworkManager = MockNetworkManager()
        var dataManager: DataManager!
        let container = Container()
        let coordinator = LoginCoordinator()
        
        beforeEach {
            dataManager = DataManager(mockNetworkManager)
            welcomeViewModel = WelcomeViewModel(router: coordinator!.unownedRouter, dataManager: dataManager)
        }
        describe("Fetch Welcome Localizations"){
            it("should succeed"){
                mockNetworkManager.shouldSucceed = true
                
                dataManager.fetchData(.welcome, type: WelcomeModel.self, completion:{ result in
                    switch result{
                    case .success(let welcomeModel):
                        expect(welcomeModel).toNot(beNil())
                    case .failure: break
                    }
                })
            }
            
            it("should fail"){
                mockNetworkManager.shouldSucceed = false
                dataManager.fetchData(.welcome, type: WelcomeModel.self, completion:{ result in
                    switch result{
                    case .success( _):
                        break
                    case .failure(let failure):
                        expect(failure).toNot(beNil())
                    }
                })
            }
        }
    }
}
