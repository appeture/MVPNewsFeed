//
//  Date.swift
//  MVP
//
//  Created by Romanovich Bogdan on 07.08.2021.
//

import Foundation
extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru-RU")
        let stringDate = dateFormatter.string(from: self)
        
        return stringDate
    }
}
