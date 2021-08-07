//
//  String.swift
//  MVP
//
//  Created by Romanovich Bogdan on 30.07.2021.
//

import Foundation
extension String {
    
    func formateForStringDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:self)!
    
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateStyle = .full
        newDateFormatter.doesRelativeDateFormatting = true
        newDateFormatter.timeStyle = .short
        newDateFormatter.locale = Locale(identifier: "ru-RU")
        let stringDate = newDateFormatter.string(from: date)
        
        
        return stringDate
        
    }
    
}
