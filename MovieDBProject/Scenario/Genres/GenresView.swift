//
//  GenresView.swift
//  MovieDBProject
//
//  Created by DDL 14 on 16/04/23.
//

import UIKit

class GenresView: UIViewController, GenresPresenterToView {
    var presenter: GenresViewToPresenter?

    @IBOutlet weak var genresTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    func setupTableView() {
        let uiNib = UINib(nibName: String(describing: GenresCell.self), bundle: nil)
        genresTableView.delegate = self
        genresTableView.dataSource = self
        genresTableView.register(uiNib, forCellReuseIdentifier: String(describing: GenresCell.self))
        self.genresTableView.isScrollEnabled = true
    }
    
    func reloadTableView() {
        genresTableView.reloadData()
    }
    
}

extension GenresView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let genres = presenter?.getGenres() else { return .zero }
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GenresCell.self), for: indexPath) as? GenresCell else { return UITableViewCell() }
        guard let genres = presenter?.getGenres() else { return cell }
        cell.genreLabel.text = genres[indexPath.row].genreName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectGenreAt(indexPath: indexPath.row)
    }
}
