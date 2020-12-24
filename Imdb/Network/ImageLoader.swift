//
//  KingfisherClone.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 11/20/20.
//

import UIKit

class ImageLoader {
    
    static let shared = ImageLoader()
    
    var cache: [URL : UIImage] = [:]

    func imageFromURL(_ url: URL, completion: @escaping ((UIImage?) -> Void)) {
        if let image = cache[url] {
            completion(image)
        } else {
            URLSession.shared.dataTask(with: url) { [unowned self] (data, response, error) in
                guard let data = data,
                      error == nil,
                      let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                
                self.cache[url] = image
                completion(image)
            }.resume()
        }
    }
    
}
