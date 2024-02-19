//
//  ArticleDetailProtocol.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewArticleDetailProtocol: AnyObject {
    
    func onGetImageFromURLSuccess(article: ArticleResult, image: UIImage)
    func onGetImageFromURLFailure(article: ArticleResult)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterArticleDetailProtocol: AnyObject {
    
    var view: PresenterToViewArticleDetailProtocol? { get set }
    var interactor: PresenterToInteractorArticleDetailProtocol? { get set }
    var router: PresenterToRouterArticleDetailProtocol? { get set }

    func viewDidLoad()
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorArticleDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterArticleDetailProtocol? { get set }
    
    var articleResult: ArticleResult? { get set }
    
    func getImageDataFromURL()
    
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterArticleDetailProtocol: AnyObject {
    
    func getImageFromURLSuccess(article: ArticleResult, image: UIImage?)
    func getImageFromURLFailure(article: ArticleResult, image: UIImage?)
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterArticleDetailProtocol: AnyObject {
    
    static func createModule(with article: ArticleResult) -> UIViewController
}
