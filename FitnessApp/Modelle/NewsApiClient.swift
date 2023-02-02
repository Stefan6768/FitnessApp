//
//  NewsApiClient.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 30.01.23.
//

import Foundation

private let baseURL = "https://newsapi.org"
private let apiKey = "6f7c4ead89274ae188e761bd6912b148"

enum NewsApiEndpoints: String {
    case everything = "/v2/everything"
    case headlines = "/v2/top-headlines"
    case sources = "/v2/top-headlines/sources"
}

struct NewsApiClient {
    func fetchNews(){
        // accessNewsApiEndpoints.everything
    }
    func fetchHeadlines(){
        // access NewsApiEndpoints.headlines
    }
    func fetchImage(imageURL: URL) {
        // fetch Image from given URL
    }
}
