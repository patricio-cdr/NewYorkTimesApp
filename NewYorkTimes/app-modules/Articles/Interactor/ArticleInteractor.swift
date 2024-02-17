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
    
    

}
