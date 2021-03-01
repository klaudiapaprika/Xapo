//
//  APIService.swift
//  XapoTest
//
//  Created by Klaudia Paprika on 2021. 02. 15..
//

import UIKit
import Moya

enum APIService {
    case welcome
}

private protocol ServiceType {
    var subcategory:String { get }
}

extension APIService: TargetType, ServiceType {

    var subcategory: String {
        switch self {
        case .welcome:
            return "WELCOME"
        }
    }
    var baseURL: URL {
        switch self {
        case .welcome:
            return URL(string:NetworkEnvironment.current.apiBaseUrl)!
        }
    }

    var path: String {
        switch self {
        case .welcome:
            return "/welcome"
        }
    }
    var method: Moya.Method {
        switch self {
        case .welcome:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .welcome:
            return .requestParameters(parameters: ["platform" : "IOS","version" : "1", "locale" : "en"], encoding: URLEncoding.queryString)
        }
    }

    var sampleData: Data {
        switch self {
        case .welcome:
            return "{\"title\": \"Welcome to iOS Test\", \"description\": \" iOS Test for Xapo bank  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.\", \"navigationText\": \"Go to Xapo\", \"termsAndPolicy\": \"Privacy policy and Terms of use\"}".utf8Encoded
        }
    }

    var headers: [String: String]? {
        switch self {
        case .welcome:
            return [:]
        }
    }
}
