//
//  MoviesView.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import UIKit

class MoviesView: UIViewController, MoviesPresenterToView {
    
    var presenter: MoviesViewToPresenter?
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter?.viewDidLoad()

    }
    
    func setupCollectionView(){
        let uiNib = UINib(nibName: String(describing: MoviesCell.self), bundle: nil)
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(uiNib, forCellWithReuseIdentifier: String(describing: MoviesCell.self))
    }
    
    func reloadCollectionView() {
        moviesCollectionView.reloadData()
    }
    
}

extension MoviesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let movies = presenter?.getMovies() else { return .zero }
        return movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MoviesCell.self), for: indexPath) as? MoviesCell else {
            return UICollectionViewCell()
        }

        guard let movies = presenter?.getMovies() else { return cell }
        cell.setupPosterImage(movie: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((moviesCollectionView.frame.size.width / 4)), height: UIScreen.main.bounds.width/2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    
}
