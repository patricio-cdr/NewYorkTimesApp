//
//  ArticleProtocol.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 16/02/24.
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewArticlesProtocol: AnyObject {
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterArticlesProtocol: AnyObject {
    
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorArticlesProtocol: AnyObject {
    
    var presenter: InteractorToPresenterArticlesProtocol? { get set }
        
    func loadArticles()
    func retrieveArticle(at index: Int)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterArticlesProtocol: AnyObject {
    func fetchArticlesSuccess(quotes: [ArticleEntity])
    func fetchArticlesFailure(errorCode: Int)
    
    func getArticleSuccess(_ article: ArticleEntity)
    func getArticleFailure()
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterArticlesProtocol: AnyObject {

}

