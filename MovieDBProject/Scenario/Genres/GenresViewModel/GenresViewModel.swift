//
//  GenresViewModel.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

struct GenreViewModel {
    var genreId: Int?
    var genreName: String?
    
    init(from response: Genre) {
        self.genreId = response.id
        self.genreName = response.name
    }
}
