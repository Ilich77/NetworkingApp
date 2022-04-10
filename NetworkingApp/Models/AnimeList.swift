//
//  AnimeList.swift
//  NetworkingApp
//
//  Created by Iliya Mayasov on 09.04.2022.
//

import Foundation

struct AnimeList: Decodable {
    let data: [Anime]?
}

struct Anime: Decodable {
    let anime_name: String?
    let anime_img: String?
}
