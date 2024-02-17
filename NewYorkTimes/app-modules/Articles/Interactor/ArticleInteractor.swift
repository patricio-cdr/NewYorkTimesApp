//
//  ArticleInteractor.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 16/02/24.
//

import Foundation

class ArticleInteractor: PresenterToInteractorArticlesProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterArticlesProtocol?
    var articles: [ArticleEntity]?
    
    func loadArticles() {
        print("Interactor receives the request from Presenter to load quotes from the server.")
        ArticleService.shared.getArticles { (code, articles) in
            self.articles = articles
            self.presenter?.fetchArticlesSuccess(quotes: articles)
        } failure: { (code) in
            self.presenter?.fetchArticlesFailure(errorCode: code)
        }

    }
    
    func retrieveArticle(at index: Int) {
        guard let articles = self.articles, articles.indices.contains(index) else {
            self.presenter?.getArticleFailure()
            return
        }
        self.presenter?.getArticleSuccess(self.articles![index])
    }
    
    

}
