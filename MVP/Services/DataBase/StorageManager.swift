//
//  StorageManager.swift
//  MVP
//
//  Created by Romanovich Bogdan on 06.08.2021.
//

import CoreData

class StorageManager: ObservableObject {
    
    
    static let shared = StorageManager()
    
    @Published var news: [News] = []
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "NewsFeed")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING COREDATA. \(error)")
            } else {
                print("COREDATA LOADING SUCCESS")
            }
            
        }
        fetchData()
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<News> = News.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        do {
            news = try container.viewContext.fetch(fetchRequest)
            
        } catch let error {
            print("ERROR FETCHING. \(error)")
        }
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch let error {
                print("Error save context in CoreData \(error)")
            }
        }
        fetchData()
    }
    
    func save(_ rawNews: [Article]) {
        
        rawNews.forEach { rawNew in
            let news = News(context: container.viewContext)
            news.title = rawNew.title
            news.content = rawNew.content
            news.author = rawNew.author
            news.publishedAt = rawNew.publishedAt
            if let stringUrl = rawNew.url {
                news.url = URL(string: stringUrl)
            } else {
                news.url = nil
            }
            saveContext()
        }
        
    }
    
    func delete(_ indexSet: IndexSet) {
        
        guard let indexSet = indexSet.first else { return }
        container.viewContext.delete(news[indexSet])
        
        saveContext()
    }
    
    func edit(_ news: News, newTitle: String) {
        news.title = newTitle
        saveContext()
    }
    
}
