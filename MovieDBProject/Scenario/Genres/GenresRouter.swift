//
//  GenresRouter.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import UIKit


class GenresRouter: GenresPresenterToRouter {
    func navigateToMovieListScreen(from view: GenresPresenterToView?, selectedGenre: GenreViewModel) {
        guard let view = view as? UIViewController else { return }
        let movieListVC = ScreenConfigurator.shared.createMoviesScreen(with: selectedGenre)
        view.navigationController?.pushViewController(movieListVC, animated: true)

    }
    
}

