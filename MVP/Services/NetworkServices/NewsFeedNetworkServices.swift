//
//  NewsFeedNetworkServices.swift
//  MVP
//
//  Created by Romanovich Bogdan on 29.07.2021.
//

import Foundation

protocol NetworkServicesProtocol {
    func getNews(completion: @escaping(Result<[Article]?, Error>) -> Void)
    func getImageData(from url: String?, completion: @escaping(Data?) -> Void)
}

class NewsFeedNetworkServices: NetworkServicesProtocol {
    
    private let apiKey = "c4e6c2ba6e874a47b99f378d564f6aed"
    
    func getNews(completion: @escaping (Result<[Article]?, Error>) -> Void) {
        guard let url = URL(
                string: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=\(apiKey)"
        ) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.global(qos: .utility).async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                
                do {
                    let newsFeed = try JSONDecoder().decode(RawNewsFeed.self, from: data)
                        completion(.success(newsFeed.articles))
                } catch let error {
                    completion(.failure(error))
                }
            }
            }.resume()
            
    }
    

    func getImageData(from url: String?, completion: @escaping(Data?) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return }
        DispatchQueue.global(qos: .utility).async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData)
            }
            
        }
        
    }
    
}
