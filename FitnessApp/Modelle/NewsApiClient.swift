//
//  NewsApiClient.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 06.02.23.
//

import UIKit

private let baseURL = "https://newsapi.org"
private let apiKey = "6f7c4ead89274ae188e761bd6912b148"

enum NewsApiEndpoints: String {
    case everything  = "/v2/everything"
    case headlines = "/v2/top-headlines"
    case sources = "/v2/top-headlines/sources"
}


func buildURL(endpoint: NewsApiEndpoints, keyword: String = "Beintraining") -> String {
    if(endpoint == NewsApiEndpoints.everything){
        return baseURL + endpoint.rawValue + "?q=\(keyword)&apiKey=\(apiKey)"
    } else {
        return baseURL + endpoint.rawValue + "?country=de&apiKey=\(apiKey)"
    }
}

struct NewsApiClient {
    func fetchNews(keyword: String = "Beintraining", completionHandler: @escaping(News) -> Void) {
        var newURL = buildURL(endpoint: NewsApiEndpoints.everything)
        print(newURL)
        newURL = newURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        guard let url = URL(string: newURL) else {return}
        let session =  URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if(data != nil && error == nil) {
                do {
                    let news = try JSONDecoder().decode(News.self, from: data!)
                    completionHandler(news)
                    
                } catch {
                    print("ERROR: \(error)")
                }
            }
        }
        dataTask.resume()
    }
    func fetchHeadlines(completionHandler: @escaping(News) -> Void) {
        var newURL = buildURL(endpoint: NewsApiEndpoints.headlines)
        newURL = newURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        guard let url = URL(string: newURL) else {return}
        let session =  URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if(data != nil && error == nil) {
                do {
                    let news = try JSONDecoder().decode(News.self, from: data!)
                    completionHandler(news)
                    
                } catch {
                    print("ERROR: \(error)")
                }
            }
        }
        dataTask.resume()
                }
                func fetchImageBy(URL: URL, completionHandler: @escaping(UIImage) -> Void) {
                    let session = URLSession.shared
                    let downloadTask  = session.downloadTask(with: URL){ data, response, error in
                        if(data != nil && error == nil) {
                            do {
                                let rawData = try Data(contentsOf: data!)
                                guard let image = UIImage(data: rawData) else {return}
                                completionHandler(image)
                            } catch {
                                print("ERROR: \(error)")
                            }
                        }
                    }
                    downloadTask.resume()
                }
            }
        

