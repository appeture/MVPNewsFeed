//
//  NewsFeedViewController.swift
//  MVP
//
//  Created by Romanovich Bogdan on 05.08.2021.
//

import UIKit

protocol NewsFeedTableViewControllerProtocol: AnyObject {
    func newsDidLoaded()
    func addNews()
    
}

class NewsFeedViewController: UIViewController {
    
    var presentor: NewsFeedTableViewPresentorInputProtocol!
    
    private var activityIndicator = UIActivityIndicatorView()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: "NewsFeedCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        activityIndicator = setupActivityIndicator(in: view)
        presentor.getNews()
        configureNavBar()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.rowHeight = UITableView.automaticDimension

        let header = StrechyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width))
        header.presentor = NewsFeedTableViewCellPresentor(view: header, model: presentor.newsFeed.first!)
        let gesture = UITapGestureRecognizer()
        header.addGestureRecognizer(gesture)
        gesture.addTarget(self, action: #selector(headerDidTaped))
        
        tableView.tableHeaderView = header
    }
    
    @objc private func headerDidTaped() {
        let detailVC = ModuleBuilder.createDetailInfoNews(with: presentor.newsFeed.first!)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    private func setupActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
    private func configureNavBar() {
        title = "NEWS"
//        navigationController?.navigationBar.prefersLargeTitles = true
        let standartNavBarAppearance = UINavigationBarAppearance()
        standartNavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        standartNavBarAppearance.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        standartNavBarAppearance.backgroundEffect = .none
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(refreshUI))
        navigationController?.navigationBar.standardAppearance = standartNavBarAppearance
    }
    
    @objc private func refreshUI() {
        presentor.refreshNews()
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension NewsFeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentor.newsFeed.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedTableViewCell
        cell.presentor = NewsFeedTableViewCellPresentor(view: cell, model: presentor.newsFeed[indexPath.row + 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = ModuleBuilder.createDetailInfoNews(with: presentor.newsFeed[indexPath.row + 1])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

// MARK: - UIScrollViewDelegate

extension NewsFeedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StrechyTableHeaderView else { return }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}

// MARK: - NewsFeedTableViewControllerProtocol

extension NewsFeedViewController: NewsFeedTableViewControllerProtocol {
    
    func addNews() {
        setupTableView()
        self.activityIndicator.stopAnimating()
        tableView.insertRows(at: [IndexPath(item: presentor.newsFeed.count - 2, section: 0)], with: .fade)
    }
    
    func newsDidLoaded() {
            self.setupTableView()
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
    }
}
