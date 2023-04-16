//
//  GenresCell.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import UIKit

class GenresCell: UITableViewCell {

    @IBOutlet weak var genreView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGenreView()
    }
    
    func setupGenreView() {
        genreView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
