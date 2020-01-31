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


