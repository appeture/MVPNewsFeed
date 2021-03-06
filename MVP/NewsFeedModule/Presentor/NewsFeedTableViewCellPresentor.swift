//
//  NewsFeedTableViewCellPresentor.swift
//  MVP
//
//  Created by Romanovich Bogdan on 31.07.2021.
//

import Foundation

protocol NewsFeedTableViewCellPresentorProtocol {
    init(view: NewsFeedTableViewCellProtocol, model: News)
}

class NewsFeedTableViewCellPresentor: NewsFeedTableViewCellPresentorProtocol {

    weak var view: NewsFeedTableViewCellProtocol!
    let model: News!
    required init(view: NewsFeedTableViewCellProtocol, model: News) {
        self.view = view
        self.model = model
        
        guard let title = model.title else { return }
        guard let imageData = model.image else { return }
        guard let date = model.publishedAt else { return }
        
        view.setTitle(with: title)
        view.setDate(with: date.toString())
        view.setImage(with: imageData)
    }
    

}
