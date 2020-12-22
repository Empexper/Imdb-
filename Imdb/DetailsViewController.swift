//
//  DetailsViewController.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/20/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var imdbIDLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var releasedLabel: UILabel!
    
    var details = DetailsOfFilm()
    var imdbID: String = ""
    var url: String  {
        get {
            return "https://www.omdbapi.com/?apikey=9cee03af&i=\(imdbID)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.genericFetch(urlString: url) { (film: DetailsOfFilm) in
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
                    KingfisherClone.shared.imageFromURL(url) { (image) in
                        DispatchQueue.main.async {
                            self.posterImage?.image = image
                        }
                    }
                
        }
      
        }
    }
}
}
        
//        guard  let title = details.Title,
//               let released = details.Released,
//               let genre = details.Genre,
//               let rating = details.imdbRating
//        else {
//            return
//        }
//        imdbIDLabel.text = imdbID
//        titleLabel.text = title
//        genreLabel.text = genre
//        ratingLabel.text = rating
//
//    }


    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    

