//
//  AlmamofireModels.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 31/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import Foundation
struct Course :Decodable {
    
        let id: Int
        let name: String
        let link: String
        let imageUrl: String
        let number_of_lessons: Int
    
}

struct movieSearchResult : Decodable{
     let Search: [Search]
    let totalResults: String?
    let Response: String?
    
    init(Search: [Search] = [], 
         totalResults: String? = nil,
         Response: String?) {
        
        self.Search = Search
        self.totalResults = totalResults
        self.Response  = Response
    }
}

struct Search :Decodable {

        let Title: String?
        let Year: String?
        let imdbID: String?
        let `Type`: String?
        let Poster: String?
}




struct Movie :Decodable{
    
 
     let Title: String?
     let Year: String?
     let Rated: String?
     let Released: String?
     let Runtime: String?
     let Genre: String?
     let Director: String?
     let Writer: String?
     let Actors: String?
     let Plot: String?
     let Language: String?
     let Country: String?
     let Awards: String?
     let Poster: String?
     let Ratings: [Ratings]
     let Metascore: String?
     let imdbRating: String?
     let imdbVotes: String?
     let imdbID: String?
     let `Type`: String?
     let DVD: String?
     let BoxOffice: String?
     let Production: String?
     let Website: String?
     let Response: String?
    
    init(
        
        
        
         Title: String?,
         Year: String?,
         Rated: String?,
         Released: String?,
         Runtime: String?,
         Genre: String?,
         Director: String?,
         Writer: String?,
         Actors: String?,
         Plot: String?,
         Language: String?,
         Country: String?,
         Awards: String?,
         Poster: String?,
         Ratings: [Ratings] = [],
         Metascore: String?,
         imdbRating: String?,
         imdbVotes: String?,
         imdbID: String?,
         `Type`: String?,
         DVD: String?,
         BoxOffice: String?,
         Production: String?,
         Website: String?,
         Response: String?) {
        self.Title = Title
        self.Year = Year
        self.Rated = Rated
        self.Released = Released
        self.Runtime = Runtime
        self.Genre = Genre
        self.Director = Director
        self.Writer = Writer
        self.Actors = Actors
        self.Plot = Plot
        self.Language = Language
        self.Country = Country
        self.Awards = Awards
        self.Poster = Poster
        self.Ratings = Ratings
        self.Metascore = Metascore
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.imdbID = imdbID
        self.`Type` = `Type`
        self.DVD = DVD
        self.BoxOffice = BoxOffice
        self.Production = Production
        self.Website = Website
        self.Response  = Response
    }
    
}

struct Ratings :Decodable {
    
        let Source: String?
        let Value: String?

}
