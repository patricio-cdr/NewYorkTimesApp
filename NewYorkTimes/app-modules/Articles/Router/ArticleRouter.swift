//
//  ArticleRouter.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation
import UIKit

class ArticleRouter: PresenterToRouterArticlesProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("ArticleRouter creates the Articles module.")
        let viewController = ArticlesViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterArticlesProtocol & InteractorToPresenterArticlesProtocol = ArticlePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ArticleRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ArticleInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - Navigation
    func pushToArticleDetail(on view: PresenterToViewArticlesProtocol, with articleResult: ArticleResult) {
        print("ArticleRouter is instructed to push ArticleDetailViewController onto the navigation stack.")
        print(articleResult)
        let articleDetailViewController = ArticleDetailRouter.createModule(with: articleResult)
            
        let viewController = view as! ArticlesViewController
        viewController.navigationController?
            .pushViewController(articleDetailViewController, animated: true)
        
    }
    
}

