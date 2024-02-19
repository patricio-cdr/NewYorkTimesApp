//
//  ImageDataService.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 17/02/24.
//

import Foundation
import UIKit

class ImageHandler {
    
    static let shared = { ImageHandler() }()
    
    func loadImageFrom(urlString: String,
                       success: @escaping (UIImage?) -> (),
                       failure: @escaping (UIImage?) -> ()) {
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Handle the response asynchronously
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        success(image)
                    }
                } else if let error = error {
                    DispatchQueue.main.async {
                        failure(UIImage(named: "newyorktimes"))
                    }
                    print("Error: \(error)")
                }
            }

            task.resume()
        }
    }
    
}
