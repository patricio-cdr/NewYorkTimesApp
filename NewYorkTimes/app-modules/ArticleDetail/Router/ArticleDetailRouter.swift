//
//  ArticleDetailRouter.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation
import UIKit

class ArticleDetailRouter: PresenterToRouterArticleDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with article: ArticleResult) -> UIViewController {
        print("ArticleDetailRouter creates the ArticleDetail module.")
        let viewController = ArticleDetailViewController()
        
        let presenter: ViewToPresenterArticleDetailProtocol & InteractorToPresenterArticleDetailProtocol = ArticleDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ArticleDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ArticleDetailInteractor()
        viewController.presenter?.interactor?.articleResult = article
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
