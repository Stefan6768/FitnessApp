//
//  ArticleViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 03.02.23.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        let stringURL = article?.url ?? "https://www.apple.com"
        guard let url = URL(string: stringURL) else {return}
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
        }
    }
}
