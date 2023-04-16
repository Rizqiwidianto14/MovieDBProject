//
//  ScreenConfigurator.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import UIKit

class ScreenConfigurator {
    public static let shared = ScreenConfigurator()
    
    func createGenresScreen() -> UIViewController {
       let view: UIViewController & GenresPresenterToView = GenresView()
       let presenter: GenresViewToPresenter & GenresInteractorToPresenter = GenresPresenter()
       let interactor: GenresPresenterToInteractor = GenresInteractor()
       let router: GenresPresenterToRouter = GenresRouter()
       
       view.presenter = presenter
       presenter.view = view
       presenter.router = router
       presenter.interactor = interactor
       interactor.presenter = presenter
       
       return view
   }
    
    func createMoviesScreen(with selectedGenre: GenreViewModel?) -> UIViewController {
       let view: UIViewController & MoviesPresenterToView = MoviesView()
        let presenter: MoviesViewToPresenter & MoviesInteractorToPresenter = MoviesPresenter(selectedGenre: selectedGenre)
       let interactor: MoviesPresenterToInteractor = MoviesInteractor()
       let router: MoviesPresenterToRouter = MoviesRouter()
       
       view.presenter = presenter
       presenter.view = view
       presenter.router = router
       presenter.interactor = interactor
       interactor.presenter = presenter
       
       return view
   }

}
