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
     let Search: [MovieResult]
}

struct MovieResult :Decodable {
    
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
     let Ratings: [movieRatings]
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
    
}

struct movieRatings :Decodable {
    
        let Source: String?
        let Value: String?

}
