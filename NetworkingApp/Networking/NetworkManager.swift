//
//  NetworkManager.swift
//  NetworkingApp
//
//  Created by Iliya Mayasov on 09.04.2022.
//

import Foundation

class NetworkManager {
    
    class func fetchAnimeList(completion: @escaping ([Anime]?) -> ()) {
        var animeList: [Anime] = []
        guard let url = URL(string: "https://anime-facts-rest-api.herokuapp.com/api/v1") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                animeList = try JSONDecoder().decode(AnimeList.self, from: data).data ?? [Anime(anime_name: "Not found", anime_img: "Not found")]
                completion(animeList)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    class func fetchAnimeImage(completion: @escaping (Data?) -> (), anime: Anime) {
        guard let url = URL(string: anime.anime_img ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            completion(data)
        }.resume()
    }
    
    private init() {}
    
}
