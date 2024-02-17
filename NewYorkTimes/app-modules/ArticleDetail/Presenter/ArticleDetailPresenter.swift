//
//  ArticleDetailPresenter.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation
import UIKit

class ArticleDetailPresenter: ViewToPresenterArticleDetailProtocol {

    // MARK: Properties
    weak var view: PresenterToViewArticleDetailProtocol?
    var interactor: PresenterToInteractorArticleDetailProtocol?
    var router: PresenterToRouterArticleDetailProtocol?
    
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        interactor?.getImageDataFromURL()
    }
    
}

extension ArticleDetailPresenter: InteractorToPresenterArticleDetailProtocol {    
    
    func getImageFromURLSuccess(article: ArticleResult, image: UIImage?) {
        print("Presenter receives the result from Interactor after it's done its job.")

        view?.onGetImageFromURLSuccess(title: article.title, byline: article.byline, image: image!, publishedDate: article.publishedDate, abstract: article.abstract)
    }
    
    func getImageFromURLFailure(article: ArticleResult, image: UIImage?) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onGetImageFromURLFailure(title: article.title, byline: article.byline)
    }
    
}
