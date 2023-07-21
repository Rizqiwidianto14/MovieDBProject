//
//  GenresInteractor.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

class GenresInteractor: GenresPresenterToInteractor {
    weak var presenter: GenresInteractorToPresenter?
    var manager: MovieManagerProtocol?
    
    init(with manager: MovieManagerProtocol = MovieManager()) {
        self.manager = manager
        self.manager?.genresDelegate = self
    }
    
    func getGenres() {
        manager?.getGenres()
    }
}

extension GenresInteractor: MovieGenresProtocol {
    func didSuccessGetGenres(response: Genres) {
        guard let genres = response.genres else { return }
        presenter?.didSuccessGetGenres(genres: genres)
    }
    
    func didFailedGetGenres(error: String) {
        print("")
    }
}
