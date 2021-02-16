//
//  NetworkManager.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 15..
//

import Foundation
import Moya

protocol NetworkManagerProtocol {
    func fetchDataFromAPIService<T:Codable>(_ target:TargetType, type: T.Type, completion: @escaping (Result<T, Error>)->())
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    func fetchDataFromAPIService<T:Codable>(_ target:TargetType, type: T.Type, completion: @escaping (Result<T, Error>)->()) {
        let provider = MoyaProvider<MultiTarget>()
        let simpleStubProvider = MoyaProvider<APIService>(stubClosure: MoyaProvider.delayedStub(1.0))
        
        //TODO: - macro for DEBUG flag
        simpleStubProvider.request(.welcome) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(moyaResponse):
                    do {
                        print(try moyaResponse.mapString())
                        let mappedData = try moyaResponse.map(T.self)
                        completion(.success(mappedData))
                    } catch let error {
                        completion(.failure(error))
                    }
                    let statusCode = moyaResponse.statusCode
                case let .failure(error):
                    completion(.failure(error))
                    break
                }
            }
        }
        //TODO: -macro for else when backend integrated
        //        provider.request(MultiTarget(target)) { result in
        //            DispatchQueue.main.async {
        //                switch result {
        //                case let .success(moyaResponse):
        //                    do {
        //                        print(try moyaResponse.mapString())
        //                        let mappedData = try moyaResponse.map(T.self)
        //                        completion(.success(mappedData))
        //                    } catch let error {
        //                        completion(.failure(error))
        //                    }
        //                    let statusCode = moyaResponse.statusCode
        //                case let .failure(error):
        //                    completion(.failure(error))
        //                    break
        //                }
        //            }
        //        }
    }
}
