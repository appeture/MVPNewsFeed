//
//  NewsFeedNetworkServicesTests.swift
//  MVPTests
//
//  Created by Romanovich Bogdan on 08.08.2021.
//

import XCTest
@testable import MVP

class NewsFeedNetworkServicesTests: XCTestCase {
    
    var newsFeedNetworkServices: NewsFeedNetworkServices!
    var imageUrl: String?
    override func setUp() {
        newsFeedNetworkServices = NewsFeedNetworkServices()
        imageUrl = "http://placehold.it/120x120&text=image1"
    }

    override func tearDownWithError() throws {
        newsFeedNetworkServices = nil
        imageUrl = nil
    }

    func testGetImageDataFromURL() throws {
        newsFeedNetworkServices.getImageData(from: imageUrl) { data in
            XCTAssertEqual(data, UIImage(named: "Image")?.pngData())
        }
    }

    func testGettingNews() {
        newsFeedNetworkServices.getNews { result in
            switch result {
            case .success(let rawNews):
                XCTAssertNotNil(rawNews)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
    

}
