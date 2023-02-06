//
//  News.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 30.01.23.
//

import Foundation

struct News: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}
