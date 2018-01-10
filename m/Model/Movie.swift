//
//  Movie.swift
//  m
//
//  Created by Sushant kumar on 09/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import Foundation

class Movie {
    
    var name: String
    var rate: String
    var year: String
    var thumbnailURL: String
    
    init(data: Dictionary<String,Any>) {
        name = data["title"] as? String ?? ""
        let tempRate = data["vote_average"] ?? 0.0
        rate = "\(tempRate)"
        year = data["release_date"] as? String ?? ""
        thumbnailURL = Api.thumbnailURL + (data["poster_path"] as? String ?? "")
    }
    
    init(movieDB: MovieDB) {
        name = movieDB.name ?? ""
        rate = movieDB.rate ?? ""
        year = movieDB.releaseYear ?? ""
        thumbnailURL = movieDB.thumbnailURL ?? ""
    }
    
}
