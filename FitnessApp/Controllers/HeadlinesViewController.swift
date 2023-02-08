//
//  HeadlinesViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 30.01.23.
//

import UIKit

class HeadlinesViewController: UIViewController {
    
    @IBOutlet weak var headlinesTableView: UITableView!
    var articles: [Article]?
    var newsApiClient = NewsApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headlinesTableView.dataSource = self
        headlinesTableView.delegate = self
        print("startingtofetchnes")
        fetchNews()
        //articles = mockData
    }
    
    func fetchNews() {
        newsApiClient.fetchHeadlines { news in
            self.articles = news.articles
            DispatchQueue.main.async {
                self.headlinesTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ArticleViewController else {return}
        guard let article = sender as? Article else {return}
        destination.article = article
    }
}

extension HeadlinesViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headlinesCell", for: indexPath) as! NewsTableViewCell
        guard let article = articles?[indexPath.row] else {return cell}
        
        cell.titleLabel.text = article.title ?? "Unbekannter Artikel"
        cell.descriptionLabel.text = article.description ?? "Keine Beschreibung vorhanden"
        guard let stringURL = article.urlToImage else {return cell}
        guard let imageURL = URL(string: stringURL) else {return cell}
        newsApiClient.fetchImageBy(URL: imageURL) { image in
            DispatchQueue.main.async {
                cell.newsImageView.image = image
            }
        }
            
        
        return cell
    }
}

 //Mark: Table View Delegate
extension HeadlinesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectArticle = articles?[indexPath.row] else {return}
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showArticleSegue", sender: selectArticle)
    }
}

