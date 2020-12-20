//
//  ListOfFilmsTableView.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/16/20.
//

import UIKit

class DataProviderTableView: NSObject, UITableViewDataSource {
    
    var films = [Film]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFilm", for: indexPath) as!  CellFilm
            let film = films[indexPath.row]
            guard let title = film.Title,
                  let year = film.Year,
                  let imbdID = film.imdbID,
                  let type = film.Type else { return cell }
               //   let poster = film.Poster
               cell.titleLabel.text = title
               cell.yearLabel.text = year
               cell.idLabel.text = imbdID
               cell.typeLabel.text = type
             //cell.imagePoster.image = poste
               
          
        return cell
    }

        
        
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
            
        }
        
        
    }

