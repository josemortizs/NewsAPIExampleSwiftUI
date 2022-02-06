//
//  NewsModels.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import Foundation

// MARK: - News
struct News: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title, description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String?
}
