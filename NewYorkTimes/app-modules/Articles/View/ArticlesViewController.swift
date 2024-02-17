//
//  ArticlesViewController.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation
import UIKit
import PKHUD

class ArticlesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad()
    }
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterArticlesProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
}

extension ArticlesViewController: PresenterToViewArticlesProtocol{
    
    func onFetchArticlesSuccess() {
        print("View receives the response from Presenter and updates itself.")
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchArticlesFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.refreshControl.endRefreshing()
    }
    
    func showHUD() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideHUD() {
        HUD.hide()
    }
    
    func deselectRowAt(row: Int) {
        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    }
    
}

// MARK: - UITableView Delegate & Data Source
extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = presenter?.titleLabelText(indexPath: indexPath)
        content.secondaryText = presenter?.sectionLabelText(indexPath: indexPath)

        // Text properties
        content.textProperties.font = .boldSystemFont(ofSize: 18)
        content.textProperties.numberOfLines = 2
        
        // Image
        let imageUrl = presenter?.articleImage(indexPath: indexPath)
        content.imageProperties.reservedLayoutSize = CGSize(width: 50, height: 50)
        
        ImageHandler.shared.loadImageFrom(urlString: imageUrl ?? "", success: { image in
            content.image = image
            cell.contentConfiguration = content
        }, failure: { errorImage in
            content.image = errorImage
            cell.contentConfiguration = content
        })
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        presenter?.deselectRowAt(index: indexPath.row)
    }
}

// MARK: - UI Setup
extension ArticlesViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true

        self.navigationItem.title = "New York Times"
    }
}
