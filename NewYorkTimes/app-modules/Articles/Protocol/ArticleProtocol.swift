//
//  ArticleProtocol.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 16/02/24.
//

import Foundation
import UIKit



// MARK: View Output (Presenter -> View)
protocol PresenterToViewArticlesProtocol: AnyObject {
    func onFetchArticlesSuccess()
    func onFetchArticlesFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
    func deselectRowAt(row: Int)
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterArticlesProtocol: AnyObject {
   
    var view: PresenterToViewArticlesProtocol? { get set }
    var interactor: PresenterToInteractorArticlesProtocol? { get set }
    var router: PresenterToRouterArticlesProtocol? { get set }
    
    var numberOfArticles: Int? { get set }
    var articlesArray: [ArticleResult]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func titleLabelText(indexPath: IndexPath) -> String?
    func subsectionLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorArticlesProtocol: AnyObject {
    
    var presenter: InteractorToPresenterArticlesProtocol? { get set }
        
    func loadArticles()
    func retrieveArticle(at index: Int)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterArticlesProtocol: AnyObject {
    
    func fetchArticlesSuccess(articles: ArticleEntity)
    func fetchArticlesFailure(errorCode: Int)
    
    func getArticleSuccess(_ articleResult: ArticleResult)
    func getArticleFailure()
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterArticlesProtocol: AnyObject {
    static func createModule() -> UINavigationController
    
    func pushToArticleDetail(on view: PresenterToViewArticlesProtocol, with articleResult: ArticleResult)
}

