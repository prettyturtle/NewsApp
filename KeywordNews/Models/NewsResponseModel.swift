//
//  NewsResponseModel.swift
//  KeywordNews
//
//  Created by yc on 2022/01/02.
//

import Foundation

struct NewsResponseModel: Decodable {
    var items = [News]()
}
struct News: Decodable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
}
