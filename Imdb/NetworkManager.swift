//
//  NetworkManager.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/17/20.
//

import Foundation

class NetworkManager {
    
    static func genericFetch<T: Decodable>(urlString: String, complition: @escaping (T) -> ()) {
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        print(String(data: data, encoding: .utf8) ?? "not a string")
                        let film = try JSONDecoder().decode(T.self, from: data )
                        complition(film)
                        print(film)
                    }
                    catch let error {
                        print("Error: \(error)")
                    }
                }
            }.resume()
        }
    }
}

//    static func getData(path: String , type: RequestType, body: Data?, completion: ((Data) -> ())?) {
//        var request = URLRequest(url: URL(fileURLWithPath: path))
//        if let data = body {
//            request.httpBody = data
//        }
//        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
//            completion?(data ?? Data())
//        })
//    }

