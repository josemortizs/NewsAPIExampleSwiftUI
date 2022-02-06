//
//  NewsBuilder.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import Foundation
import Moya

enum NewsBuilder {
    case news(search: String)
}

extension NewsBuilder: TargetType {
    var baseURL: URL {
        URL(string: "https://newsapi.org")!
    }
    
    var path: String {
        switch self {
        case .news(_):
            return "/v2/everything"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .news(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .news(let search):
            return .requestParameters(parameters: ["q": search], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization": "YOUR_API_KEY"]
    }
    
    var sampleData: Data {
        return "".data(using: .utf8) ?? Data()
    }
    
}
