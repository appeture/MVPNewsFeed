//
//  NewsFeedPresentorTableView.swift
//  MVP
//
//  Created by Romanovich Bogdan on 29.07.2021.
//

import Foundation

protocol NewsFeedTableViewPresentorInputProtocol {
    func getNews()
    var rawNews: [Article]? { get set }
    var image: Data? { get set }
}

protocol NewsFeedPresentorOutputProtocol {
    init(view: NewsFeedTableViewControllerProtocol, networkServices: NetworkServicesProtocol)
}

class NewsFeedPresentor: NewsFeedPresentorOutputProtocol, NewsFeedTableViewPresentorInputProtocol {

    weak var view: NewsFeedTableViewControllerProtocol!
    private var networkServices: NetworkServicesProtocol!
    
    var rawNews: [Article]?
    var image: Data? = nil
    
    required init(view: NewsFeedTableViewControllerProtocol, networkServices: NetworkServicesProtocol) {
        self.view = view
        self.networkServices = networkServices
    }
    
    func getNews() {
        networkServices.getNews { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let news):
                self.rawNews = news
                self.getImageForHeader()
            case .failure(let error):
                print(error)
            }
        }
    }
    func getImageForHeader() {
        let url = rawNews?.first?.urlToImage
        networkServices.getImageData(from: url) { imageData in
            self.image = imageData
            self.view.newsDidLoaded()
        }
    }
        
}
