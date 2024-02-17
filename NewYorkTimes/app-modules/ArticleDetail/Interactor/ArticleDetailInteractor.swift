//
//  ArticleDetailInteractor.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation
import UIKit

class ArticleDetailInteractor: PresenterToInteractorArticleDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterArticleDetailProtocol?
    var articleResult: ArticleResult?
    
    func getImageDataFromURL() {
        print("Interactor receives the request from Presenter to get image data from the server.")
        
        guard let media = articleResult?.media else { return }
        
        if media.isEmpty {
            self.presenter?.getImageFromURLFailure(article: self.articleResult!, image: UIImage(named: "newyorktimes"))
        } else {
            ImageHandler.shared.loadImageFrom(urlString: media.first?.mediaMetadata[2].url ?? "") { (image) in
                self.presenter?.getImageFromURLSuccess(article: self.articleResult!, image: image)
            } failure: { (errorImage) in
                self.presenter?.getImageFromURLFailure(article: self.articleResult!, image: errorImage)
            }
            
        }

    }
    

}
