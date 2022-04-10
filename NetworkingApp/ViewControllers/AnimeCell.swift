//
//  AnimeCell.swift
//  NetworkingApp
//
//  Created by Iliya Mayasov on 09.04.2022.
//

import UIKit

class AnimeCell: UITableViewCell {
    
    //MARK: IB Outlets
    @IBOutlet weak var animeIMG: UIImageView!
    @IBOutlet weak var animeNameLabel: UILabel!
    
    // MARK: - Networking
    func configure(with anime: Anime) {
        animeNameLabel.text = anime.anime_name
        
        NetworkManager.fetchAnimeImage(completion: { Data in
            DispatchQueue.main.async {
                guard let Data = Data else { return }
                self.animeIMG.image = UIImage(data: Data)
            }
        }, anime: anime)
    }
}
