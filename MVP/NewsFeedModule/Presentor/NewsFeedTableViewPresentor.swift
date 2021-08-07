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
    private let storageServices: StorageManagerProtocol!
    var newsFeed: [News] = []
    
    
    required init(view: NewsFeedTableViewControllerProtocol,
                  networkServices: NetworkServicesProtocol,
                  storageServices: StorageManagerProtocol) {
        self.view = view
        self.networkServices = networkServices
        self.storageServices = storageServices
        getNewsFromDB()
    }
    
    
    func getNews() {
        if newsFeed.isEmpty {
            downloadNewsFromNetworkService()
        }
        self.view.newsDidLoaded()
    }
    
    private func getNewsFromDB() {
        storageServices.fetchData { result in
            switch result {
            case .success(let news):
                self.newsFeed = news
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
        getNewsFromDB()
    }
    
    private func saveNewsInDB(rawNews: [Article]?) {
        rawNews?.forEach { news in
            networkServices.getImageData(from: news.urlToImage) { image in
                self.storageServices.save(news, imageData: image)
            }
            
        }
    }
    
}
