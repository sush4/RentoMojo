//
//  DBUtil.swift
//  m
//
//  Created by Sushant kumar on 11/01/18.
//  Copyright © 2018 Sushant kumar. All rights reserved.
//

import UIKit
import CoreData

class DBUtil: NSObject {
    
    static let sharedInstance = DBUtil()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "m")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func updateMovieList(movieList: Array<Movie>) {
        let result = DBUtil.sharedInstance.getMovieDBList()
        for movieDB in result {
            DBUtil.sharedInstance.persistentContainer.viewContext.delete(movieDB)
        }
        for movie in movieList {
            let movieDB = NSEntityDescription.insertNewObject(forEntityName: "MovieDB", into: persistentContainer.viewContext) as! MovieDB
            movieDB.name = movie.name
            movieDB.rate = movie.rate
            movieDB.releaseYear = movie.year
            movieDB.thumbnailURL = movie.thumbnailURL
        }
        DBUtil.sharedInstance.saveContext()
    }
    
    func getMovieList() -> Array<Movie> {
        var movieList = Array<Movie>()
        let result = DBUtil.sharedInstance.getMovieDBList()
        for movieDB in result {
            movieList.append(Movie(movieDB: movieDB))
        }
        return movieList
    }
    
    func getMovieDBList() -> Array<MovieDB> {
        do {
            let result : Array<MovieDB> = try persistentContainer.viewContext.fetch(MovieDB.fetchRequest())
            return result
        } catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
}
