//
//  ArticlePresenter.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation

class ArticlePresenter: ViewToPresenterArticlesProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewArticlesProtocol?
    var interactor: PresenterToInteractorArticlesProtocol?
    var router: PresenterToRouterArticlesProtocol?
    
    var articlesStrings: [String]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        view?.showHUD()
        interactor?.loadArticles()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadArticles()
    }
    
    func numberOfRowsInSection() -> Int {
//        guard let articlesStrings = self.articlesStrings else {
//            return 0
//        }
//
//        return articlesStrings.count
        return 5
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let articlesStrings = self.articlesStrings else {
            return nil
        }
        
        return articlesStrings[indexPath.row]
    }

    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveArticle(at: index)
    }
    
    func deselectRowAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
    
}

// MARK: - Outputs to view
extension ArticlePresenter: InteractorToPresenterArticlesProtocol {
    
    func fetchArticlesSuccess(articles: [ArticleEntity]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.articlesStrings = articles.compactMap { $0.status }
        view?.hideHUD()
        view?.onFetchArticlesSuccess()
    }
    
    func fetchArticlesFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchArticlesFailure(error: "Couldn't fetch quotes: \(errorCode)")
    }
    
    func getArticleSuccess(_ article: ArticleEntity) {
        router?.pushToArticleDetail(on: view!, with: article)
    }
    
    func getArticleFailure() {
        view?.hideHUD()
        print("Couldn't retrieve quote by index")
    }
}
    
