//
//  MoviesInteractor.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

class MoviesInteractor: MoviesPresenterToInteractor {
    weak var presenter: MoviesInteractorToPresenter?
    var manager: MovieManagerProtocol?
    
    init(with manager: MovieManagerProtocol = MovieManager()) {
        self.manager = manager
        self.manager?.movieListByGenreDelegate = self
    }
    
    func getMovieListByGenre(pageId: Int, genreId: Int) {
        manager?.getMoviesByGenres(pageId: pageId, genreId: genreId)
    }
    
}

extension MoviesInteractor: MovieListByGenreProtocol {
    func didFailedGetMovieList(error: String) {
        print("")
    }
    
    func didSuccessGetMovieList(response: Movies) {
        guard let movies = response.results else { return }
        presenter?.didSuccessGetMovieList(movies: movies)
        
    }
}
