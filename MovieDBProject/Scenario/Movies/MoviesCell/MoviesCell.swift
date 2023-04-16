//
//  MoviesCell.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import UIKit
import Kingfisher

class MoviesCell: UICollectionViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupPosterImage(movie: MovieViewModel) {
        guard let posterPath = movie.posterPath else {return}
        let url = URL(string: Constant.imageBaseUrl+"/w500"+posterPath)
        moviePoster.kf.setImage(with: url)
    }

}
