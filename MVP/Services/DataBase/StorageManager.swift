//
//  StorageManager.swift
//  MVP
//
//  Created by Romanovich Bogdan on 06.08.2021.
//

import CoreData

protocol StorageManagerProtocol {
        func fetchData(completion: @escaping(Result<[News], Error>) -> Void)
        func save(_ rawNew: Article, imageData: Data?) -> News
}

class StorageManager: StorageManagerProtocol {
    
    private let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "NewsFeed")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING COREDATA. \(error)")
            } else {
                print("COREDATA LOADING SUCCESS")
            }
            
        }
    }
    
    func fetchData(completion: @escaping (Result<[News], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<News> = News.fetchRequest()
        
        do {
            let news = try container.viewContext.fetch(fetchRequest)
            completion(.success(news))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func save(_ rawNew: Article, imageData: Data?) -> News {
        
        let news = News(context: container.viewContext)
        news.title = rawNew.title
        news.content = rawNew.content
        news.author = rawNew.author
        news.publishedAt = rawNew.publishedAt
        news.image = imageData
        if let stringUrl = rawNew.url {
            news.url = URL(string: stringUrl)
        } else {
            news.url = nil
        }
        
        saveContext()
        return news
    }
    
    private func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch let error {
                print("Error save context in CoreData \(error)")
            }
        }
    }
    
    func clearData() {
        
    }
    
}
