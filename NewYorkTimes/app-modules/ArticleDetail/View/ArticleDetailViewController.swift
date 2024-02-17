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
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var articleTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
}

extension ArticleDetailViewController: PresenterToViewArticleDetailProtocol {
    func onGetImageFromURLSuccess(title: String, byline: String, image: UIImage, publishedDate: String, abstract: String) {
        print("View receives the response from Presenter and updates itself.")
        articleTitle.text = title
        characterImageView.image = image
        self.navigationItem.title = byline
    }
    
    func onGetImageFromURLFailure(title: String, byline: String) {
        print("View receives the response from Presenter and updates itself.")
        articleTitle.text = title
        characterImageView.image = UIImage(named: "newyorktimes")
        self.navigationItem.title = byline
    }
    
}

// MARK: - UI Setup
extension ArticleDetailViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(characterImageView)
        self.view.addSubview(articleTitle)
        
        let widthHeightConstant = self.view.frame.width * 0.8
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.widthAnchor.constraint(equalToConstant: widthHeightConstant)
            .isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: widthHeightConstant)
            .isActive = true
        characterImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            .isActive = true
        characterImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            .isActive = true
        
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            .isActive = true
        articleTitle.topAnchor.constraint(equalTo: characterImageView.bottomAnchor)
            .isActive = true
        articleTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            .isActive = true
    }
    
}
