//
//  MovieListViewModel.swift
//  m
//
//  Created by Sushant kumar on 10/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import Foundation

class MovieListViewModel {
    
    var list = Array<Movie>()
    var page:Int = 1
    
    init() {
        self.list = DBUtil.sharedInstance.getMovieList()
    }
    
    func getList(page: Int,success:@escaping () -> ()) {
        self.page = 1
        Api.getMovieList(page: 1) { movieList in
            DBUtil.sharedInstance.updateMovieList(movieList: movieList)
            self.list.append(contentsOf: movieList)
            success()
        }
    }
    
    func loadNextPage(success:@escaping (_ newIndexPath:Array<IndexPath>) -> ()) {
        self.page += 1
        Api.getMovieList(page: self.page) { movieList in
            var indexPaths = Array<IndexPath>()
            for i in 0 ..< movieList.count {
                indexPaths.append(IndexPath(row: self.list.count + i, section: 0))
            }
            
            self.list.append(contentsOf: movieList)
            success(indexPaths)
        }
    }
}
