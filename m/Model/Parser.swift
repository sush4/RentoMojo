//
//  Parser.swift
//  m
//
//  Created by Sushant kumar on 10/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import Foundation

class ParseData {
    static func getMovieList(data: Dictionary<String,Any>) -> Array<Movie> {
        var movieList: Array<Movie> = Array()
        let list: Array<Dictionary<String,Any>> = data["results"] as? Array ?? Array()
        for movieJson in list {
            movieList.append(Movie(data: movieJson))
        }
        return movieList
    }
}
