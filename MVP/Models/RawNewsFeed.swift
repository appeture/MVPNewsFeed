// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsFeed = try? newJSONDecoder().decode(RawNewsFeed.self, from: jsonData)

import Foundation

// MARK: - NewsFeed
struct RawNewsFeed: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Decodable {
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case articleDescription = "description"
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String?
}
