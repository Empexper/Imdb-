//
//  DetailsViewController.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/20/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet private var posterImage: UIImageView!
    @IBOutlet private var imdbIDLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var genreLabel: UILabel!
    @IBOutlet private var ratingLabel: UILabel!
    @IBOutlet private var releasedLabel: UILabel!
    
    private var details = DetailsOfFilm()
    var imdbID: String = ""
    private var url: String  {
        get {
            return "https://www.omdbapi.com/?apikey=9cee03af&i=\(imdbID)"
        }
    }
    var api: String {
        get {
     API.selectedMovie.rawValue + imdbID
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Вынести в отдельную функцию!!!
        setUpLabels()
        
    
    }
    
    private func setUpLabels() {
        NetworkManager.genericFetch(urlString: api ) { (film: DetailsOfFilm) in
            self.details = film
            DispatchQueue.main.async {
                self.imdbIDLabel.text = self.imdbID
                if let title = self.details.Title {
                    self.titleLabel.text = title
                }
                if let genre = self.details.Genre {
                    self.genreLabel.text = genre
                }
                if let rating = self.details.imdbRating {
                    self.ratingLabel.text = rating
                }
                if let released = self.details.Released {
                    self.releasedLabel.text = released
                }
                if let url = URL(string: self.details.Poster ?? "" ) {
                    ImageLoader.shared.imageFromURL(url) { (image) in
                        DispatchQueue.main.async {
                            self.posterImage?.image = image
                        }
                    }
                    
                }
                
            }
        }
        
    }
}



