//
//  SearchResult.swift
//  iTunes App
//
//  Created by William Chen on 9/3/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
        
    }
    
    var title: String
    var creator: String
    
  
    
}

struct SearchResults: Codable {
    let results: [SearchResult]
}
