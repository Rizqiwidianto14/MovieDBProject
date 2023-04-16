//
//  GenresPresenter.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

class GenresPresenter: GenresViewToPresenter {
    
    var view: GenresPresenterToView?
    var interactor: GenresPresenterToInteractor?
    var router: GenresPresenterToRouter?
    var genresViewModel: [GenreViewModel]?
    
    func viewDidLoad() {
        interactor?.getGenres()
    }
    
    func getGenres() -> [GenreViewModel]? {
        return genresViewModel
    }
    
    func didSelectGenreAt(indexPath: Int?) {
        guard let genresViewModel = genresViewModel, let indexPath = indexPath else { return }
        router?.navigateToMovieListScreen(from: self.view, selectedGenre: genresViewModel[indexPath])
    }
    
    
}

extension GenresPresenter: GenresInteractorToPresenter {
    func didSuccessGetGenres(genres: [Genre]) {
        self.genresViewModel = genres.map{ GenreViewModel(from: $0)}
        view?.reloadTableView()
    }
    
    
}
