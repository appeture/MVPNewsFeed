//
//  DetailNewsInfoCellPresentor.swift
//  MVP
//
//  Created by Romanovich Bogdan on 08.08.2021.
//

import Foundation

protocol DetailNewsInfoCellPresentorProtocol {
    init(view: DetailInfoTableViewCell, model: News)
}

class DetailNewsInfoCellPresentor: DetailNewsInfoCellPresentorProtocol {
    
    private var view: DetailInfoTableViewCellProtocol!
    private weak var model: News!
    
    required init(view: DetailInfoTableViewCell, model: News) {
        self.view = view
        self.model = model
            
        view.setDescription(with: model.articleDescription ?? "no content")
        
    }
    
    
}
