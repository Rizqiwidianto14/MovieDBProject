//
//  MoviesViewModel.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

struct MovieViewModel {
    var posterPath: String?
    var title: String?
    var id: Int?
    
    init(from response: Movie) {
        self.posterPath = response.posterPath
        self.id = response.id
        self.title = response.title
    }
}
