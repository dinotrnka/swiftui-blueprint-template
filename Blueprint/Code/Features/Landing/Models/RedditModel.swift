//
//  RedditModel.swift
//  Blueprint
//
//  Created by Dino Trnka on 18. 2. 2021..
//

import Foundation

struct RedditModel: Codable {
    let kind: String
    let data: RedditPostModel
}

struct RedditPostModel: Codable {
    let id: String
    let title: String
    let author: String
    let numComments: Int
    let thumbnail: String
    let createdUtc: Double
    var readed: Bool? = false
}
