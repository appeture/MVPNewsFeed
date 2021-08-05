//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Romanovich Bogdan on 03.08.2021.
//

import UIKit

protocol Builder {
    static func createNewsFeedModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createNewsFeedModule() -> UIViewController {
        let view = NewsFeedViewController()
        let networkService = NewsFeedNetworkServices()
        let presentor = NewsFeedPresentor(view: view, networkServices: networkService)
        
        view.presentor = presentor
        
//        return NewsFeedViewController()
        return view
    }
    
    static func createTestView() -> UIViewController {
        return NewsFeedViewController()
    }
    
}
