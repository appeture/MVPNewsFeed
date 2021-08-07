//
//  UILabel.swift
//  MVP
//
//  Created by Romanovich Bogdan on 03.08.2021.
//

import UIKit

extension UILabel {
    convenience init(font: UIFont? = UIFont.AvenirNext(size: 14), aligment: NSTextAlignment = .left, color: UIColor = UIColor(named: "textColor")!, lines: Int = 1, sizeToFit: Bool = false, shadow: Bool = false) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = aligment
        self.textColor = color
        self.numberOfLines = lines
        self.font = font
        self.adjustsFontSizeToFitWidth = sizeToFit
        if shadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 3.0
            self.layer.shadowOpacity = 1.0
            self.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.layer.masksToBounds = false
        }
    }
    
    
}


