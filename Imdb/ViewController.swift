//
//  FilmListViewController.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    let url = "https://www.omdbapi.com/?apikey=d78f7557&s=Hacker&type=movie"
    
    let dataProvider = DataProviderTableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.rowHeight = 200
        NetworkManager.genericFetch(urlString: url, complition: { (films: Result) in
        print(films)
            if let films = films.Search {
            self.dataProvider.films = films
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
            
        })
    
    
}
}

//enum RequestType: String {
//    case GET = "GET"
//}
//
//protocol Body {
//
//}
//
//protocol FilmProtocol {
//
//}
//
//
//struct HorrorBody: Body {
//
//}
//
//struct HorrorFilm: FilmProtocol {
//
//}
//

//class RequestManager {
//    
//    static func getHorrorFilms(horroBody: HorrorBody, completion: ((HorrorFilm) -> ())?) {
//        let body = horroBody as! Data
//        let type = RequestType.GET
//        let path = "imdb.com/horrorget"
//        NetworkManager.getData(path: path, type: type, body: body, completion: { data in
//            let film = data as! HorrorFilm
//            completion?(film)
//        })
//    }
//}
