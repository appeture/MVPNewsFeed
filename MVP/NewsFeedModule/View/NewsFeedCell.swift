//
//  NewsFeedCell.swift
//  MVP
//
//  Created by Romanovich Bogdan on 05.08.2021.
//

import  UIKit

class NewsFeedCell: UITableViewCell {
    
    var presentor: NewsFeedTableViewCellPresentorProtocol!
    
    
}

//MARK: - NewsFeedTableViewCellProtocol

extension NewsFeedCell: NewsFeedTableViewCellProtocol {
    func setImage(with imageData: Data) {
        self.imageView?.image = UIImage(data: imageData)
    }
    
    func setTitle(with title: String) {
        self.textLabel?.text = title
    }
    
    func setDate(with date: String) {
        self.detailTextLabel?.text = date
    }
    
    
}
