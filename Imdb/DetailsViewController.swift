//
//  DetailsViewController.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/20/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var imdbIDLabel: UILabel!
    
    var details = DetailsOfFilm()
    var imdbID: String = ""
    var url: String  {
        get {
            return "http://www.omdbapi.com/?apikey=d78f7557&i=\(imdbIDLabel)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.genericFetch(urlString: url) { (film: DetailsOfFilm) in
            self.details = film
            
            
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

