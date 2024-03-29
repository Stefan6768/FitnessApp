//
//  Article.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 30.01.23.
//

import Foundation

public struct Article: Codable{
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
}
