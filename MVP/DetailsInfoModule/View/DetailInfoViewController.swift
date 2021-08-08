//
//  DetailsInfoViewController.swift
//  MVP
//
//  Created by Romanovich Bogdan on 05.08.2021.
//

import UIKit

protocol DetailsInfoViewControllerProtocol: AnyObject {
    func settingView()
}

class DetailsInfoViewController: UIViewController {
    
    var presentor: DetailsInfoViewControllerOutputPresentorProtocol!
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailInfoTableViewCell.self, forCellReuseIdentifier: "DetailsInfoCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentor.prepareData()
        view.backgroundColor = .white
        setupTableView()
        
    }
    
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.rowHeight = 300
    
        
        let header = StrechyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width))
        header.presentor = NewsFeedTableViewCellPresentor(view: header, model: presentor.model)
        
        tableView.tableHeaderView = header
    }

    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension DetailsInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsInfoCell", for: indexPath) as! DetailInfoTableViewCell
        cell.presentor = DetailNewsInfoCellPresentor(view: cell, model: presentor.model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
}

// MARK: - UIScrollViewDelegate

extension DetailsInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StrechyTableHeaderView else { return }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}

// MARK: - NewsFeedTableViewControllerProtocol

extension DetailsInfoViewController: DetailsInfoViewControllerProtocol {
    func settingView() {
        tableView.reloadData()
    }
    
    
}
