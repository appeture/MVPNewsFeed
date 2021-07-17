//
//  ToDoListTableViewController.swift
//  MVP
//
//  Created by Romanovich Bogdan on 14.07.2021.
//

import UIKit

protocol ToDoListTableViewControllerProtocol: AnyObject {
    
}

class ToDoListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       setUpNavigationBar()
    }

    private func setUpNavigationBar() {
        title = "Task List"
        
        navigationController?.navigationBar.prefersLargeTitles = false
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.gray
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
        
        navigationController?.navigationBar.tintColor = .cyan
    }
    
    @objc private func addNewTask() {
        let taskVC = TaskViewController()
        present(taskVC, animated: true)
    }
 
}
