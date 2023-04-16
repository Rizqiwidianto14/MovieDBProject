//
//  GenresModel.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

struct Genres: Codable {
    var genres: [Genre]?
}
struct Genre: Codable {
    var id: Int?
    var name: String?
}
