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
        let storageService = StorageManager()
        let presentor = NewsFeedPresentor(view: view, networkServices: networkService, storageServices: storageService)
        
        view.presentor = presentor
        
//        return NewsFeedViewController()
        return view
    }
    
    static func createDetailInfoNews(with model: News) -> UIViewController {
        let view = DetailsInfoViewController()
        let presentor = DetailInfoViewControllerPresentor(view: view, model: model)
        view.presentor = presentor
        return view
    }
    
    static func createWebKitView(with url: URL) -> UIViewController {
        let view = WebKitViewController()
        let presentor = WebKitViewControllerPresentor(view: view, url: url)
        view.presentor = presentor
        return view
    }
    
}
