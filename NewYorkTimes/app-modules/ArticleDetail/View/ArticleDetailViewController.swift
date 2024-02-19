//
//  ArticleDetailViewController.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation
import UIKit

class ArticleDetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterArticleDetailProtocol?
    
    lazy var mediaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var bylineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var publishedDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var abstractLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
}

extension ArticleDetailViewController: PresenterToViewArticleDetailProtocol {
    func onGetImageFromURLSuccess(article: ArticleResult, image: UIImage) {
        print("View receives the response from Presenter and updates itself.")
        titleLabel.text = article.title
        bylineLabel.text = article.byline
        publishedDateLabel.text = article.publishedDate
        mediaImageView.image = image
        abstractLabel.text = article.abstract
        
        self.navigationItem.title = article.section
    }
    
    func onGetImageFromURLFailure(article: ArticleResult) {
        print("View receives the response from Presenter and updates itself.")
        titleLabel.text = article.title
        bylineLabel.text = article.byline
        publishedDateLabel.text = article.publishedDate
        mediaImageView.image = UIImage(named: "newyorktimes")
        abstractLabel.text = article.abstract
        
        self.navigationItem.title = article.section
    }
    
}

// MARK: - UI Setup
extension ArticleDetailViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        
        let padding: CGFloat = 16.0
        
        // Title Label
        titleLabel.numberOfLines = 0 // Allow multiple lines for the title
        titleLabel.textAlignment = .center // Center-align the title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24) // Set font size
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding)
        ])
        
        // Byline Label
        bylineLabel.numberOfLines = 0 // Allow multiple lines for the byline
        bylineLabel.textAlignment = .center // Center-align the byline
        bylineLabel.font = UIFont.systemFont(ofSize: 14) // Set smaller font size
        bylineLabel.textColor = .gray // Set text color
        bylineLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bylineLabel)
        NSLayoutConstraint.activate([
            bylineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            bylineLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
            bylineLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding)
        ])
        
        // Published Date Label
        publishedDateLabel.textAlignment = .center // Center-align the published date
        publishedDateLabel.font = UIFont.systemFont(ofSize: 12) // Set font size
        publishedDateLabel.textColor = .gray // Set text color
        publishedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(publishedDateLabel)
        NSLayoutConstraint.activate([
            publishedDateLabel.topAnchor.constraint(equalTo: bylineLabel.bottomAnchor, constant: padding),
            publishedDateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
            publishedDateLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding)
        ])
        
        // Image View
        mediaImageView.contentMode = .scaleAspectFit // Adjust content mode as needed
        mediaImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mediaImageView)
        NSLayoutConstraint.activate([
            mediaImageView.topAnchor.constraint(equalTo: publishedDateLabel.bottomAnchor, constant: padding),
            mediaImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
            mediaImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding),
            mediaImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust height as needed
        ])
        
        // Abstract Label
        abstractLabel.numberOfLines = 0 // Allow multiple lines for the abstract
        abstractLabel.textAlignment = .center // Center-align the abstract
        abstractLabel.font = UIFont.systemFont(ofSize: 16) // Set font size
        abstractLabel.textColor = .black // Set text color
        abstractLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(abstractLabel)
        NSLayoutConstraint.activate([
            abstractLabel.topAnchor.constraint(equalTo: mediaImageView.bottomAnchor, constant: padding),
            abstractLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
            abstractLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding)
        ])
    }

    
}
