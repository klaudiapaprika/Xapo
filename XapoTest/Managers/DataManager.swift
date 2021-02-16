//
//  DataManager.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 15..
//

import UIKit
import Moya

class DataManager {
    
    static let shared = DataManager()
    private let networkManager: NetworkManagerProtocol
    
    init(_ networkManager:NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        //TODO:- Init and use persistence manager with RealmSwift
    }
    
    func fetchData<T:Codable>(_ target:APIService, type: T.Type, completion: @escaping (Result<T, Error>)->()) {
        networkManager.fetchDataFromAPIService(target, type: type, completion: { result in
            completion(result)
        })
    }
}
