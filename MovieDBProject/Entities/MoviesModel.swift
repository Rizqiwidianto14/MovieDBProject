//
//  MoviesModel.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

struct Movies: Codable {
    var results: [Movie]?
}

struct Movie: Codable {
    var posterPath: String?
    var title: String?
    var id: Int?
}
