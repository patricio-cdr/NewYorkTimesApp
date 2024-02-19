//
//  MockInteractor.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 19/02/24.
//

import Foundation

class MockInteractor: PresenterToInteractorArticlesProtocol {
    
    var presenter: InteractorToPresenterArticlesProtocol?
    
    func checkForArticlesInCoreData() {
        
    }
    
    func saveArticlesInCoreData(articles: ArticleEntity) {
        
    }
    
    func getArticlesFromCoreData() {
        
    }
    
    
    // MARK: Properties
    var mockArticles: ArticleEntity?
    
    // MARK: Methods
    
    func setMockArticles(_ articles: ArticleEntity) {
        mockArticles = articles
    }
    
    func loadArticles() {
        // Simulate loading articles with mock data
        if let articles = mockArticles {
            presenter?.fetchArticlesSuccess(articles: articles)
        } else {
            presenter?.fetchArticlesFailure(errorCode: 404) // Simulate failure with error code 404
        }
    }
    
    func retrieveArticle(at index: Int) {
        // Simulate retrieving an article at the specified index
        guard let articles = mockArticles else {
            presenter?.getArticleFailure() // Simulate failure if mock articles are not set
            return
        }
        guard index >= 0 && index < articles.results.count else {
            presenter?.getArticleFailure() // Simulate failure for invalid index
            return
        }
        presenter?.getArticleSuccess(articles.results[index]) // Simulate success with the article at the specified index
    }
   
}

