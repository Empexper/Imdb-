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
    
    let dataProvider = DataProviderTableView()
    let delegateTableView = DelegateTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = delegateTableView
        
        tableView.rowHeight = 200
        NetworkManager.genericFetch(urlString: url, complition: { (films: Result) in
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
