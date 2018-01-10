//
//  MovieListViewController.swift
//  m
//
//  Created by Sushant kumar on 08/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    let bottomSpinner: UIActivityIndicatorView = UIActivityIndicatorView()
    let viewModel = MovieListViewModel()
    private let CellReuseIdentifier = "MovieTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "search_movie".localized
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        searchTableView.register(UINib.init(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier)
        
        searchTableView.tableFooterView = bottomSpinner
        
        viewModel.getList(page: 1) {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier, for: indexPath)
        if let cell = cell as? MovieTableViewCell {
            cell.updateValue(movie: viewModel.list[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = viewModel.list.count - 1
        if lastItem == indexPath.row {
            viewModel.loadNextPage(success: { indexPaths in
                DispatchQueue.main.async {
//                   self.searchTableView.insertRows(at: indexPaths, with: .none)
                    self.searchTableView.reloadData()
                }
            })
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailViewModel = MovieDetailViewModel(movie: viewModel.list[indexPath.row])
        let movieDetailViewController = MovieDetailViewController(viewModel: movieDetailViewModel)
    self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }


}

