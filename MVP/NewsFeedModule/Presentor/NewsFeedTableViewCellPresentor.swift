//
//  NewsFeedTableViewCellPresentor.swift
//  MVP
//
//  Created by Romanovich Bogdan on 31.07.2021.
//

import Foundation

protocol NewsFeedTableViewCellPresentorProtocol {
    init(view: NewsFeedTableViewCellProtocol, model: Article)
}


class NewsFeedTableViewCellPresentor: NewsFeedTableViewCellPresentorProtocol {
    
    weak var view: NewsFeedTableViewCellProtocol!
    let model: Article!
    required init(view: NewsFeedTableViewCellProtocol, model: Article) {
        self.view = view
        self.model = model
        
        configureImageCell()
        view.setTitle(with: model.title ?? "no title")
        view.setDate(with: model.publishedAt ?? "no date")
    }
    
    func configureImageCell() {
        let networkService = NewsFeedNetworkServices()
        networkService.getImageData(
            from: model.urlToImage) { image in
            if let image = image {
                self.view.setImage(with: image)
            }
        }
    }

    
}
