//
//  MockModelRawNews.swift
//  MVPTests
//
//  Created by Romanovich Bogdan on 08.08.2021.
//

import UIKit
@testable import MVP

struct MockModelRawNews {
    
    
    
    static func getMockModelArticleNews() -> [Article] {
        var articles: [Article] = []
        let source = Source(id: "FOO", name: "BAR")
        articles.append(Article(source: source,
                                author: "FOO",
                                title: "BAR",
                                articleDescription: "BAZ",
                                url: "FOO",
                                urlToImage: "BAR",
                                publishedAt: "2016-04-14T10:44:00+0000",
                                content: "FOO"))
        return articles
    }
    
    static func getMockModelNews() -> [News] {
        let storage = StorageManager()
        var news: [News] = []
        let image = UIImage(systemName: "person")
        let rawNews = getMockModelArticleNews()
        news.append(storage.save(rawNews.first!, imageData: image?.pngData()))
        
        return news
    }
    
    
}

