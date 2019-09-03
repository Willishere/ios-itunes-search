//
//  SearchResultController.swift
//  iTunes App
//
//  Created by William Chen on 9/3/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation

class SearchResultController {
    let baseURL = URL(string: "https://itunes.apple.com/search")!
    
    var searchResults: [SearchResult] = []
    
    func performSearch (with searchTerm: String, resultType: ResultType, completion: @escaping () -> Void){
        
        let searchURL = baseURL.appendingPathComponent("searchResults")
        
        var components = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)
        
        let searchName = URLQueryItem(name: "name", value: searchTerm)
        components?.queryItems = [searchName]
        
        guard let requestURL = components?.url else {
            completion()
            return}
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            
            if let error = error {
                NSLog("Error searching for item: \(error), on line \(#line) in \(#file)")
            }
            
            guard let data = data else {
                NSLog("No data returned from searching for people")
                completion()
                return
            }
            do {
                let decoder = JSONDecoder()
                
                let searchResults = try decoder.decode(SearchResults.self, from: data)
                
                self.searchResults = searchResults.results
            } catch {
                NSLog("Error decoding PersonSearch from data: \(error)")
            }
            
            completion()
    }
        
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
}
}
