//
//  DetailInfoTableViewCell.swift
//  MVP
//
//  Created by Romanovich Bogdan on 17.07.2021.
//

import UIKit


protocol DetailInfoTableViewCellProtocol: AnyObject {
    func setDescription(with description: String)
}

class DetailInfoTableViewCell: UITableViewCell {
    
    var presentor: DetailNewsInfoCellPresentorProtocol!
    let identifier = "DetailsInfoCell"
    
    private let desctiptionLabel = UILabel(font: .AvenirNext(.regular, size: 16),
                                           color: .black,
                                           lines: 4,
                                           sizeToFit: false)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDescriptionLabelConstraint()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupDescriptionLabelConstraint() {
        
        contentView.addSubview(desctiptionLabel)
        NSLayoutConstraint.activate([
            desctiptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            desctiptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            desctiptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
        ])
    }
    
    
}

//MARK: - NewsFeedTableViewCellProtocol

extension DetailInfoTableViewCell: DetailInfoTableViewCellProtocol {
    func setDescription(with description: String) {
        desctiptionLabel.text = description
        
    }
    
}
