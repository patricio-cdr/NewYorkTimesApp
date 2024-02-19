//
//  ArticleInteractor.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 16/02/24.
//

import Foundation
import UIKit
import CoreData

class ArticleInteractor: PresenterToInteractorArticlesProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterArticlesProtocol?
    var articles: ArticleEntity?
    
    func getArticlesFromCoreData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let articles = try context.fetch(fetchRequest)
            if articles.count > 0 {
                var articleEntityModel = ArticleEntity()
                
                for article in articles as! [NSManagedObject] {
                    
                    var articleResultModel = ArticleResult()
                
                    if let title = article.value(forKey: "title") as? String {
                        articleResultModel.title = title
                    }
                    if let section = article.value(forKey: "section") as? String {
                        articleResultModel.section = section
                    }
                    if let publishedDate = article.value(forKey: "published_date") as? String {
                        articleResultModel.publishedDate = publishedDate
                    }
                    if let abstract = article.value(forKey: "abstract") as? String {
                        articleResultModel.abstract = abstract
                    }
                    
                    articleEntityModel.results.append(articleResultModel)
                }
                articleEntityModel.numResults = articleEntityModel.results.count
                self.articles = articleEntityModel
                self.presenter?.fetchArticlesSuccess(articles: articleEntityModel)
                
            } else {
                print("No articles in Core Data")
            }
            
        } catch {
            
        }
       
    }
    
    func saveArticlesInCoreData(articles: ArticleEntity) {
        
        for articleResult in articles.results {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let newArticle = NSEntityDescription.insertNewObject(forEntityName: "Article", into: context)
            
            // Attributes
            newArticle.setValue(UUID(), forKey: "id")
            newArticle.setValue(articleResult.title, forKey: "title")
            newArticle.setValue(articleResult.section, forKey: "section")
            newArticle.setValue(articleResult.publishedDate, forKey: "published_date")
            newArticle.setValue(articleResult.abstract, forKey: "abstract")
            
            let imageThumbnail = articleResult.media.first?.mediaMetadata.first?.url ?? ""
            newArticle.setValue(imageThumbnail, forKey: "image_thumbnail")
            
            let image = articleResult.media.first?.mediaMetadata[2].url ?? ""
            newArticle.setValue(image, forKey: "image")
            
            do {
                try context.save()
            } catch {
                print("error")
            }
            
        }
    }
    
    func deleteAllObjects(forEntityName entityName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(batchDeleteRequest)
        } catch {
            print("Error deleting all objects for entity \(entityName): \(error.localizedDescription)")
        }
    }
    
    
    func checkForArticlesInCoreData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let articles = try context.fetch(fetchRequest)
            if articles.count > 0 {
                // Delete all instances of an entity in core data
                self.deleteAllObjects(forEntityName: "Article")
                // Add articles to core data
                self.saveArticlesInCoreData(articles: self.articles!)
            } else {
                // Add articles to core data
                self.saveArticlesInCoreData(articles: self.articles!)
                
            }
            
        } catch {
            
        }
    }
    
    func loadArticles() {
        print("Interactor receives the request from Presenter to load something from the server.")
        if Connectivity.isConnectedToInternet {
            ArticleService.shared.getArticles { (code, articles) in
                self.articles = articles
                self.presenter?.fetchArticlesSuccess(articles: articles)
            } failure: { (code) in
                self.presenter?.fetchArticlesFailure(errorCode: code)
            }

        } else {
            self.getArticlesFromCoreData()
        }
        
        
    }
    
    func retrieveArticle(at index: Int) {
        guard let articles = self.articles else {
            self.presenter?.getArticleFailure()
            return
        }
        self.presenter?.getArticleSuccess((self.articles?.results[index])!)
    }
    
    

}
