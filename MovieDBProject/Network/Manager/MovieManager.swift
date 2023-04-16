//
//  MovieManager.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import Moya

protocol Networkable {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

protocol MovieManagerProtocol {
    var genresDelegate: MovieGenresProtocol? { get set }
    var movieListByGenreDelegate: MovieListByGenreProtocol? { get set }
    func getGenres()
    func getMoviesByGenres(pageId: Int, genreId: Int)
}

class MovieManager: Networkable, MovieManagerProtocol {
    var provider = Moya.MoyaProvider<MovieDBServices>()
    weak var genresDelegate: MovieGenresProtocol?
    weak var movieListByGenreDelegate: MovieListByGenreProtocol?


    func getGenres() {
        provider.request(.genres) { [weak self] (result) in
            switch result {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let genres = try decoder.decode(Genres.self, from: result.data)
                    self?.genresDelegate?.didSuccessGetGenres(response: genres)
                } catch let error {
                    self?.genresDelegate?.didFailedGetGenres(error: error.localizedDescription)
                }
            case .failure(let error):
                self?.genresDelegate?.didFailedGetGenres(error: error.localizedDescription)
            }
        }
    }
    
    func getMoviesByGenres(pageId: Int, genreId: Int) {
        provider.request(.movieListByGenres(page: pageId, genreId: genreId)) { [weak self] (result) in
            switch result {
            case .success(let result):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let movies = try decoder.decode(Movies.self, from: result.data)
                    self?.movieListByGenreDelegate?.didSuccessGetMovieList(response: movies)
                } catch let error {
                    self?.movieListByGenreDelegate?.didFailedGetMovieList(error: error.localizedDescription)
                }
            case .failure(let error):
                self?.movieListByGenreDelegate?.didFailedGetMovieList(error: error.localizedDescription)
            }
            
        }
    }
    
}

protocol MovieGenresProtocol: AnyObject {
    func didSuccessGetGenres(response: Genres)
    func didFailedGetGenres(error: String)
}

protocol MovieListByGenreProtocol: AnyObject {
    func didSuccessGetMovieList(response: Movies)
    func didFailedGetMovieList(error: String)
}
