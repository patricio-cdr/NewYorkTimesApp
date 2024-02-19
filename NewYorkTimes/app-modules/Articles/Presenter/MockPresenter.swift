//
//  MockPresenter.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 19/02/24.
//

import Foundation

class MockPresenter: ViewToPresenterArticlesProtocol, InteractorToPresenterArticlesProtocol {
    
    func fetchArticlesSuccess(articles: ArticleEntity) {
        
    }
    
    func fetchArticlesFailure(errorCode: Int) {
        
    }
    
    func getArticleSuccess(_ articleResult: ArticleResult) {
        
    }
    
    func getArticleFailure() {
        
    }
    
    
    func refresh() {
        
    }
    
    func numberOfRowsInSection() -> Int {
        return 0
    }
    
    func titleLabelText(indexPath: IndexPath) -> String? {
        return ""
    }
    
    func sectionLabelText(indexPath: IndexPath) -> String? {
        return ""
    }
    
    func articleImage(indexPath: IndexPath) -> String? {
        return ""
    }
    
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
    
    
    // MARK: Properties
    weak var view: PresenterToViewArticlesProtocol?
    var interactor: PresenterToInteractorArticlesProtocol?
    var router: PresenterToRouterArticlesProtocol?
    
    var numberOfArticles: Int?
    var articlesArray: [ArticleResult]?
    
    // Mock data
    var mockNumberOfArticles: Int = 1
    var mockArticlesArray: [ArticleResult] = [
        ArticleResult()
    ]
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Mock Presenter is being notified that the View was loaded.")
        view?.showHUD()
        fetchMockArticlesSuccess()
    }
    
    // Simulated success callback with mock data
    private func fetchMockArticlesSuccess() {
        print("Mock Presenter simulates receiving the result from Interactor after it's done its job.")
        
        self.numberOfArticles = mockNumberOfArticles
        self.articlesArray = mockArticlesArray
        
        view?.hideHUD()
        view?.onFetchArticlesSuccess()
    }
}

