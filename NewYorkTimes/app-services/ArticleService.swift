//
//  ArticleService.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 16/02/24.
//

import Foundation
import ObjectMapper

class ArticleService {
    static let shared = { ArticleService() }()
    
    func getArticles(success: @escaping (Int, ArticleEntity) -> (), failure: @escaping (Int) -> ()) {
        
        let urlString = self.configureApiCall(ArticleEndpoints.VIEWED, "/1.json", "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ")
        
        APIClient.shared.getJSONObject(urlString: urlString) { (code, articles) in
            if let articleEntity = Mapper<ArticleEntity>().map(JSON: articles) {
                success(code, articleEntity)
            } else {
                print("Mapping failed")
            }
            
        } failure: { code in
            failure(code)
        }

    }
    
    func configureApiCall(_ endpoint: String, _ parameter: String, _ key: String) -> String {
        return endpoint + parameter + "?api-key=" + key
    }
}
