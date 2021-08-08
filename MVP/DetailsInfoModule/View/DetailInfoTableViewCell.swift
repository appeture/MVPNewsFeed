//
//  DetailInfoTableViewCell.swift
//  MVP
//
//  Created by Romanovich Bogdan on 17.07.2021.
//

import UIKit


protocol DetailInfoTableViewCellProtocol: AnyObject {
    func setDescription(with description: String)
    func setNameAutor(with name: String)
    func setName(with name: String)
}

class DetailInfoTableViewCell: UITableViewCell {
    
    var presentor: DetailNewsInfoCellPresentorProtocol!
    let identifier = "DetailsInfoCell"
    
    private let desctiptionLabel = UILabel(font: .AvenirNext(.regular, size: 16),
                                           color: .black,
                                           lines: 0,
                                           sizeToFit: false)
    
    private let nameAutorLabel = UILabel(font: .AvenirNext(.demiBold),
                                         aligment: .center,
                                         color: .darkGray)
    
    private let nameLabel = UILabel(font: .AvenirNext(.demiBold),
                                         aligment: .center,
                                         color: .darkGray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNameAutorLabelConstraint()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraint()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupNameAutorLabelConstraint() {
        contentView.addSubview(nameAutorLabel)
        NSLayoutConstraint.activate([
            nameAutorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameAutorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
    
    func setupNameLabelConstraints() {
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
   
    
    
    func setupDescriptionLabelConstraint() {
        
        contentView.addSubview(desctiptionLabel)
        NSLayoutConstraint.activate([
            desctiptionLabel.topAnchor.constraint(equalTo: nameAutorLabel.bottomAnchor, constant: 16),
            desctiptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            desctiptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
    
    
}

//MARK: - NewsFeedTableViewCellProtocol

extension DetailInfoTableViewCell: DetailInfoTableViewCellProtocol {
    func setName(with name: String) {
        nameLabel.text = name
    }
    
    func setNameAutor(with name: String) {
        nameAutorLabel.text = name
    }
    
    func setDescription(with description: String) {
        desctiptionLabel.text = description
    }
    
}
