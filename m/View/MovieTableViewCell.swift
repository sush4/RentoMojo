//
//  MovieTableViewCell.swift
//  m
//
//  Created by Sushant kumar on 10/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateValue(movie:Movie) {
        nameLabel.text = movie.name
        ratingLabel.text = "rate".localized + movie.rate
        releaseYearLabel.text = movie.year
        thumbnailImage.imageFromServerURL(urlString: movie.thumbnailURL, defaultImage: "User")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
