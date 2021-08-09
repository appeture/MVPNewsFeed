//
//  WebKitViewController.swift
//  MVP
//
//  Created by Romanovich Bogdan on 08.08.2021.
//

import UIKit
import WebKit

protocol WebKitViewControllerProtocol: AnyObject {
    func setUrl(_ url: URL)
}

class WebKitViewController: UIViewController, WebKitViewControllerProtocol {
    
    private let webView = WKWebView()
    var presentor: WebKitViewControllerPresentorInputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
        
    }
    
    func setUrl(_ url: URL) {
        webView.load(URLRequest(url: url))
        print("url")
    }

}
