//
//  FilmListViewController.swift
//  Imdb
//
//  Created by Zakhar Sidorov  on 12/16/20.
//

import UIKit

class ViewController: UIViewController {
    //// 1) 
    
    
    @IBOutlet var tableView: UITableView!
    
    
    
    let url = "https://www.omdbapi.com/?apikey=9cee03af&s=Hacker&type=movie"
    
    let dataProvider = DataProviderTableView()
    let delegateTableView = DelegateTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = delegateTableView
        delegateTableView.controller = self 
        
        tableView.rowHeight = 200
        NetworkManager.genericFetch(urlString: API.movieHacker.rawValue , complition: { (films: Result) in
            print(films)
            if let films = films.Search {
                self.dataProvider.films = films
                self.delegateTableView.films = films
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}
