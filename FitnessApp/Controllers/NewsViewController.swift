//
//  KalenderViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var newsTableView: UITableView!
    var articles: [Article]?
    var keyword: String = "Fussball"
    var newsApiClient = NewsApiClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        newsTableView.delegate = self
        fetchNews()
        //articles = mockData
    }
    
    func fetchNews() {
        newsApiClient.fetchNews(keyword: "Basketball") { news in
            self.articles = news.articles
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showSettingsSegue"){
            guard let destination = segue.destination as? ArticleViewController else {return}
            guard let article = sender as? Article else {return}
            destination.article = article
        } else {
            guard let destination = segue.destination as? SettingsViewController else {return}
            guard let keyword = sender as? String else {return}
            destination.keyword = keyword
            destination.delegate = self
        }
    }
    
    @IBAction func settingPressed() {
        performSegue(withIdentifier: "showSettingsSegue", sender: keyword)
    }
}

extension NewsViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
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
    
    // Mark: Table View Delegate
    extension NewsViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let selectArticle = articles?[indexPath.row] else {return}
            tableView.deselectRow(at: indexPath, animated: true)
            performSegue(withIdentifier: "showArticleSegue", sender: selectArticle)
        }
    }

extension NewsViewController: ChangeKeywordDelegate {
    func applyChanges(keyword: String) {
        self.keyword = keyword
        fetchNews()
    }
}

