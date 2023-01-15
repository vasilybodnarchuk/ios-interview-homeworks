//
//  RootViewController.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

class RootViewController: UIViewController {
    
    private var router: Routerable!
    private weak var tableView: UITableView!
    
    init(router: Routerable) {
        super.init(nibName: nil, bundle: nil)
        self.router = router
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupTableView()
    }
}

// MARK: TableView

private extension RootViewController {
    func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView = tableView
        tableView.dataSource = self
    }
}

// MARK: TableViewDatasource

extension RootViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        var configuration = UIListContentConfiguration.cell()
        configuration.text = "text"
        cell.contentConfiguration = configuration
        return cell
    }
}
