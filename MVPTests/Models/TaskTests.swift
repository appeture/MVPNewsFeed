//
//  TaskTests.swift
//  MVPTests
//
//  Created by Romanovich Bogdan on 14.07.2021.
//

import XCTest
@testable import MVP

class TaskTests: XCTestCase {
    
    var task: Task?
    var image: UIImage?
    var imageData: Data?
    
    override func setUp() {
        super.setUp()
        image = UIImage(systemName: "checkmark")
        imageData = image?.pngData()
        
        task = Task(title: "Foo", description: "Bar", image: imageData)
        
    }

    override func tearDown() {
        
        super.tearDown()
    }

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleAndNotGivenDescription() {
        let task = Task(title: "Foo")
        XCTAssertEqual(task.title, "Foo")
        XCTAssertNil(task.description)
    }
    func testWhenGivenTitleAndDescritpon() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertEqual(task.title, "Foo")
        XCTAssertEqual(task.description, "Bar")
    }
    
    func testInitTaskWithImage() {
        XCTAssertNotNil(task?.image)
    }
    
    func testInitPersonWithDate() {
        XCTAssertNotNil(task?.date)
    }
    

    
    
    func testPerformanceExample() throws {
       
        self.measure {
            
        }
    }

}
