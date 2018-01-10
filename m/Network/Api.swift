//
//  Api.swift
//  m
//
//  Created by Sushant kumar on 09/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import Foundation

class Api {
    
    private static let listURL = "https://api.themoviedb.org/3/discover/movie?api_key=7195962570c7daea772cb95fc6780257&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page="
    static let thumbnailURL = "http://image.tmdb.org/t/p/w185/"
    
    public static func getMovieList(page: Int, success:@escaping (Array<Movie>) -> () ) {
    
        let url = URL(string: listURL+String(page))
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                let movieList = ParseData.getMovieList(data: json)
                success(movieList)
            } catch let error as NSError {
                success(Array())
                print(error)
            }
        }).resume()
    }
    
}

