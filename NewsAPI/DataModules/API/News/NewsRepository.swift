//
//  NewsRepository.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import Foundation
import Moya

final class NewsRepository {
    
    let apiNews = MoyaProvider<NewsBuilder>()
    
    public func getNews(search: String, completionHandler: @escaping (_ data: News?, _ error: NewsError?) -> Void) {
        
        apiNews.request(.news(search: search)) { result in
            
            switch result {
            case .success(let response):
                switch response.statusCode {
                case 200:
                    do {
                        
                        let str = String(decoding: response.data, as: UTF8.self)
                        print(str)
                        
                        let news = try newJSONDecoder().decode(News.self, from: response.data)
                        completionHandler(news, nil)
                    } catch {
                        completionHandler(nil, NewsError.DESERIALIZING_ERROR)
                    }
                default:
                    completionHandler(nil, NewsError.NO_GET_A_200_RESPONSE)
                }
            case .failure(_):
                completionHandler(nil, NewsError.FAIL_CONNECTED)
            }
        }
    }
}
