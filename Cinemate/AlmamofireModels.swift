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

struct myStructWithInit {
    let myString: String?
    let myInt: Int?
    let myDouble: Double?
    
    init(myString: String? = nil, //👈
         myInt: Int? = nil,
         myDouble: Double? = nil) {
        
        self.myString = myString
        self.myInt = myInt
        self.myDouble = myDouble
    }
}
//// MARK: - Welcome
//struct movieSearchResult: Decodable {
//    let search: [Search]
//    let totalResults, response: String
//
//    enum CodingKeys: String, CodingKey {
//        case search = "Search"
//        case totalResults
//        case response = "Response"
//    }
//}
//// MARK: - Search
//struct Search: Decodable {
//    let title, year, imdbID: String
//    let type: TypeEnum
//    let poster: String
//
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case year = "Year"
//        case imdbID
//        case type = "Type"
//        case poster = "Poster"
//    }
//}
//
//enum TypeEnum: String, Codable {
//    case movie = "movie"
//    case series = "series"
//}


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
