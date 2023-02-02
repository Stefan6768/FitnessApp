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

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        articles = mockData
    }
}

extension NewsViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        guard let article = articles?[indexPath.row] else {return cell}
        
        var content = cell.defaultContentConfiguration()
        content.text = article.title ?? "Unbekannter Titel"
        cell.contentConfiguration = content
        
        return cell
    }
}

private let mockData = [

 Article(
author: "Steve Dent",
title: "US labor regulator says Apple violated employee's rights with restrictive work rules",
description: "The National Labor Relation Board (NLRB) has determined that Apple's rules around leaks violate worker's rights, Bloomberg has reported. Apple's actions and statements from executives \"tend to interfere with, restrain or coerce employees\" from exercising thei…",
url: "https://www.engadget.com/us-labor-regulator-says-apple-violated-workers-rights-102524891.html",
urlToImage: "https://s.yimg.com/os/creatr-uploaded-images/2022-01/e9dc2520-803a-11ec-9ff1-8e035bab6cb8"),

 Article(
author: "Oliver O'Connell",
title: "Alex Murdaugh trial – live: Legal scion’s five shocking words after wife and son’s murders revealed - The Independent",
description: "Fourth day of testimony to get under way in Walterboro, Colleton County, South Carolina as Alex Murdaugh stands trial for murders of wife Maggie and son Paul",
url: "https://www.independent.co.uk/news/world/americas/crime/alex-murdaugh-jail-witness-list-paul-maggie-trial-live-b2272563.html",
urlToImage: "https://static.independent.co.uk/2023/01/30/15/SEI141952732.jpg?quality=75&width=1200&auto=webp"
    )
 ]
