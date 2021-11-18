//
//  Article.swift
//  urlStudy
//
//  Created by Tak_iMac on 2021/11/18.
//

import Foundation

//codable : json 데이터를 swift 객체로, swift 객체를 json 데이터로
struct Article: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt :String?
}
