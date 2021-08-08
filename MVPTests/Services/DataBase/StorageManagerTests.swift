//
//  StorageManagerTests.swift
//  MVPTests
//
//  Created by Romanovich Bogdan on 07.08.2021.
//

import XCTest
import UIKit
@testable import MVP

class StorageManagerTests: XCTestCase {
    
    var storage: StorageManager!
    var image: UIImage!
    var imageData: Data?
    var rawNews: Article?
    var news: [News]?
    
    
    override func setUpWithError() throws {
        storage = StorageManager()
        storage?.deleteAllData()
        image = UIImage(systemName: "person")
        imageData = image?.pngData()
        rawNews = MockModelRawNews.getMockModelArticleNews().first
        
    }
    
    override func tearDownWithError() throws {
        storage?.deleteAllData()
        storage = nil
        imageData = nil
        rawNews = nil
    }
    
    func testCheckSorageSaveReturnsNotNil() throws {
        let saveData = storage?.save(rawNews!, imageData: imageData)
        XCTAssertNotNil(saveData)
    }
    
    func testFetchingDataFromDB() {
        _ = storage?.save(rawNews!, imageData: imageData)
        storage?.fetchData{ result in
            switch result {
            case .success(let news):
                XCTAssertEqual(news.first!.author, self.rawNews?.author)
                XCTAssertEqual(news.first!.title, self.rawNews?.title)
                XCTAssertEqual(news.first!.content, self.rawNews?.content)
                XCTAssertEqual(news.first!.url, URL(string: self.rawNews!.url!))
                XCTAssertEqual(news.first!.publishedAt!, self.rawNews?.publishedAt?.toDate())
                XCTAssertEqual(news.first!.image, self.image.pngData())
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func testCorrectlyReturnsNewDataModel() {
        let saveData = storage?.save(rawNews!, imageData: imageData)
        XCTAssertEqual(saveData?.author, rawNews?.author)
        XCTAssertEqual(saveData?.title, rawNews?.title)
        XCTAssertEqual(saveData?.content, rawNews?.content)
        XCTAssertEqual(saveData?.url, URL(string: rawNews!.url!))
        XCTAssertEqual(saveData?.publishedAt!, rawNews?.publishedAt?.toDate())
        XCTAssertEqual(saveData?.image, image.pngData())
    }
    
    
    
    func testfetchData() throws {
        _ = storage?.save(rawNews!, imageData: imageData)
        
        storage?.fetchData(completion: { result in
            switch result {
            case .success(let news):
                XCTAssertEqual(news.first?.author, "FOO")
            case .failure(let error):
                print(error)
            }
            
        })
        
    }
    
    func testDeleteAllDataFromDB() {
        _ = storage?.save(rawNews!, imageData: imageData)
        storage?.fetchData { result in
            switch result {
            case .success(let news):
                XCTAssertEqual(news.count, 1)
            case .failure(let error):
                print(error)
            }
        }
        storage.deleteAllData()
        storage?.fetchData { result in
            switch result {
            case .success(let news):
                XCTAssertEqual(news.count, 0)
            case .failure(let error):
                print(error)
            }
        }
    }
    

}





