//
//  NewsFeedPresentorTableView.swift
//  MVP
//
//  Created by Romanovich Bogdan on 29.07.2021.
//

import Foundation

protocol NewsFeedTableViewPresentorInputProtocol {
    func getNews()
    
    var newsFeed: [News] { get }
}

protocol NewsFeedPresentorOutputProtocol {
    init(view: NewsFeedTableViewControllerProtocol, networkServices: NetworkServicesProtocol, storageServices: StorageManagerProtocol)
}

class NewsFeedPresentor: NewsFeedPresentorOutputProtocol, NewsFeedTableViewPresentorInputProtocol {
    
    weak var view: NewsFeedTableViewControllerProtocol!
    private var networkServices: NetworkServicesProtocol!
    private var storageServices: StorageManagerProtocol!
    var newsFeed: [News] = []
    
    
    required init(view: NewsFeedTableViewControllerProtocol,
                  networkServices: NetworkServicesProtocol,
                  storageServices: StorageManagerProtocol) {
        self.view = view
        self.networkServices = networkServices
        self.storageServices = storageServices
    }
    
    
    func getNews() {
        getNewsFromDB()
        
    }
    
    private func getNewsFromDB() {
        storageServices.fetchData { result in
            switch result {
            case .success(let news):
                    self.newsFeed = news
                if news.isEmpty {
                    self.downloadNewsFromNetworkService()
                } else {
                    self.view.newsDidLoaded()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func downloadNewsFromNetworkService() {
        networkServices.getNews { [weak self] result in
            guard let self = self else { return }
            
                switch result {
                case .success(let rawNews):
                    self.saveNewsInDB(rawNews: rawNews)
                case .failure(let error):
                    print(error)
                }
            
        }
    }
    
    private func saveNewsInDB(rawNews: [Article]?) {
        DispatchQueue.global(qos: .userInitiated).async {
            rawNews?.forEach { news in
                self.networkServices.getImageData(from: news.urlToImage) { image in
                    self.storageServices.save(news, imageData: image)
                    self.getNews()
                }
            }
            
        }
        
    }
    
}
