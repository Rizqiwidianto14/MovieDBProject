//
//  MoviesProtocol.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

protocol MoviesPresenterToView: AnyObject {
    var presenter: MoviesViewToPresenter? { get set }
    func reloadCollectionView()

}

protocol MoviesViewToPresenter: AnyObject {
    var view: MoviesPresenterToView? { get set }
    var interactor: MoviesPresenterToInteractor? { get set }
    var router: MoviesPresenterToRouter? { get set }
    func viewDidLoad()
    func getMovies() -> [MovieViewModel]?
}

protocol MoviesPresenterToInteractor: AnyObject {
    var presenter: MoviesInteractorToPresenter? { get set }
    func getMovieListByGenre(pageId: Int, genreId: Int)

}

protocol MoviesPresenterToRouter: AnyObject {
    func navigateBack(from view: MoviesPresenterToView?)
}

protocol MoviesInteractorToPresenter: AnyObject {
    func didSuccessGetMovieList(movies: [Movie])
}
