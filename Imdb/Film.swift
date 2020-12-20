//
//  Film.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/16/20.
//

import Foundation

struct Film: Codable {
    var Title: String?
    var Year: String?
    var imdbID: String?
    var `Type`: String?
    var Poster: String?
}

    struct Result: Codable {
      let Search: [Film]?
    }



