//
//  MockNetworkManager.swift
//  XapoTestTests
//
//  Created by Klaudia Paprika on 2021. 02. 15..
//

import Quick
import Nimble
import Moya
@testable import XapoTest

class MockNetworkManager: NetworkManagerProtocol {

    var shouldSucceed = true
    var myNetworkErrorsObj = MyNetworkErrors.noData
    
    func fetchDataFromAPIService<T:Codable>(_ target:TargetType, type: T.Type, completion: @escaping (Result<T, Error>)->()) {
        if shouldSucceed{
            //completion(.success(welcomeModelObj as! T))
        }
        else{
            completion(.failure(myNetworkErrorsObj))
        }
    }
}
