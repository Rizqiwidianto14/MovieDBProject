//
//  MoviesPresenter.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

class MoviesPresenter: MoviesViewToPresenter {
    weak var view: MoviesPresenterToView?
    var interactor: MoviesPresenterToInteractor?
    var router: MoviesPresenterToRouter?
    var pageId: Int?
    var selectedGenre: GenreViewModel?
    var moviesViewModel: [MovieViewModel]?
    
    init(selectedGenre: GenreViewModel?) {
        self.selectedGenre = selectedGenre
    }
    
    func viewDidLoad() {
        pageId = 1
        guard let genreId = selectedGenre?.genreId, let pageId = pageId else { return }
        interactor?.getMovieListByGenre(pageId: pageId, genreId: genreId)
    }
    
    func getMovies() -> [MovieViewModel]? {
        return moviesViewModel
    }
    
    
    
}

extension MoviesPresenter: MoviesInteractorToPresenter {
    func didSuccessGetMovieList(movies: [Movie]) {
        self.moviesViewModel = movies.map{ MovieViewModel(from: $0)}
        view?.reloadCollectionView()
    }
    
    
}
