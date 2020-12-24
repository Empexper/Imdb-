//
//  DelegateTableView.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/20/20.
//

import UIKit

class DelegateTableView: NSObject, UITableViewDelegate{
   
    var controller: ViewController?
  //  let dataProvider = DataProviderTableView()
    var films = [Film]()
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailsVc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let film = films[indexPath.row]
        guard let Id = film.imdbID else { return }
        detailsVc.imdbID = Id
        
        controller?.navigationController?.pushViewController(detailsVc, animated: true)
    }
    
}


