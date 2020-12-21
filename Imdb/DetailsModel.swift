//
//  DetailsModel.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/20/20.
//

import Foundation

struct DetailsOfFilm: Codable {
    var Title: String?
    var Released: String?
    var Genre: String?
    var imdbRating: String?
    var poster: String?
}

