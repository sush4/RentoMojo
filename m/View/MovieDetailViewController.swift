//
//  MovieDetailViewController.swift
//  m
//
//  Created by Sushant kumar on 11/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    private let viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "movie_detail".localized
        nameLabel.text = viewModel.movie.name
        releaseYearLabel.text = viewModel.movie.year
        ratingLabel.text = "rate".localized + viewModel.movie.rate
        movieImage.imageFromServerURL(urlString: viewModel.movie.thumbnailURL, defaultImage: "User")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
