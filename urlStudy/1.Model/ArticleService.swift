//
//  ArticleService.swift
//  urlStudy
//
//  Created by Tak_iMac on 2021/11/18.
//

import Foundation

struct ArticleService: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}
