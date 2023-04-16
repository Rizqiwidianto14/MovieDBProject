//
//  GenresProtocol.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Foundation

protocol GenresPresenterToView: AnyObject {
    var presenter: GenresViewToPresenter? { get set }
    func reloadTableView()

}

protocol GenresViewToPresenter: AnyObject {
    var view: GenresPresenterToView? { get set }
    var interactor: GenresPresenterToInteractor? { get set }
    var router: GenresPresenterToRouter? { get set }
    func viewDidLoad()
    func getGenres() -> [GenreViewModel]?
    func didSelectGenreAt(indexPath: Int?)
}

protocol GenresPresenterToInteractor: AnyObject {
    var presenter: GenresInteractorToPresenter? { get set }
    func getGenres()

}

protocol GenresPresenterToRouter: AnyObject {
    func navigateToMovieListScreen(from view: GenresPresenterToView?, selectedGenre: GenreViewModel)
}

protocol GenresInteractorToPresenter: AnyObject {
    func didSuccessGetGenres(genres: [Genre])
}
