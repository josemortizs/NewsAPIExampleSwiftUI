//
//  NewsLocal.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 6/2/22.
//

import Foundation

final class NewsLocal {
    
    var userDefault: UserDefaults
    var jsonDecoder: JSONDecoder
    var jsonEncoder: JSONEncoder
    
    init() {
        userDefault = UserDefaults.standard
        jsonDecoder = JSONDecoder()
        jsonEncoder = JSONEncoder()
    }
    
    public func getLocalNews() -> News? {
        
        let json = userDefault.string(forKey: "news") ?? ""
        let jsonData = Data(json.utf8)
        
        do {
            let news: News = try jsonDecoder.decode(News.self, from: jsonData)
            return news
        } catch {
            print(error)
            return nil
        }
    }
    
    public func setLocalNews(news: News) {
        
        do {
            let jsonData = try jsonEncoder.encode(news)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            print(json!)
            
            userDefault.setValue(json, forKey: "news")
            
        } catch {
            print(error)
        }
    }
}
