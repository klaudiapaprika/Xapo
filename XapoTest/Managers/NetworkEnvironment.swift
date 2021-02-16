//
//  NetworkEnvironment.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 15..
//

import Foundation

enum NetworkEnvironment {
    case production
    case nspUAT
    case preProd
    
    //TODO: check with flags
    static let `default`: NetworkEnvironment = .nspUAT

    
    private static var currentCached: NetworkEnvironment?
    
    static var current: NetworkEnvironment {
        .default
    }
    
    static func updateIfNeeded() {
        currentCached = nil
    }
}

extension NetworkEnvironment {
    var apiBaseUrl: String {
        switch self{
        case .production: return "https://xapo.com"
        case .nspUAT: return "https://xapo.com.xp"
        case .preProd: return "https://xapo.com.xp"
        }
    }
}

enum MyNetworkErrors: Error{
    case noData
    case invalidUrl(String)
}
