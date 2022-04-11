//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Iliya Mayasov on 09.04.2022.
//

import UIKit

class MainViewController: UITableViewController {

    // MARK: - Private Properties
    private var animeList: [Anime] = []
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 400
        getData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnimeCell
        let anime = animeList[indexPath.row]
        cell.configure(with: anime)
        return cell
    }
}

    // MARK: - Networking
extension MainViewController {
    private func getData() {
        NetworkManager.shared.fetchAnimeList(completion: { animeList in
            DispatchQueue.main.async {
                guard let animeList = animeList else { return }
                self.animeList = animeList
                self.tableView.reloadData()
            }
        })
    }
}
