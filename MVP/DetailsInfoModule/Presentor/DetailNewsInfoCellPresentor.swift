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
            
        view.setDescription(with: model.articleDescription ?? "Нет данных")
        view.setNameAutor(with: model.author ?? "Автор неизвестен")
        view.setName(with: model.name ?? "")
        guard let url = model.url else { return }
        view.setLinkForButton(with: url)
    }
}
