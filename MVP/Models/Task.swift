//
//  Task.swift
//  MVP
//
//  Created by Romanovich Bogdan on 14.07.2021.
//

import Foundation

struct Task {
    let title: String
    var description: String?
    var image: Data?
    private(set) var date: Date
    
    init(title: String, description: String? = nil, image: Data? = nil) {
        self.title = title
        self.description = description
        self.image = image
        
        date = Date()
    }
}
