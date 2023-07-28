//
//  CatsListRequest.swift
//  Cats
//
//  Created by gabriel hideki on 27/07/23.
//

import Foundation

struct CatsListRequest: DataRequest {
    
    private let clientID: String = "1ceddedc03a5d71"
    private let clientSecret: String = "63775118a9f912fd91ed99574becf3b375d9eeca"

    var url: String {
        let baseURL: String = "h8ps://api.imgur.com"
        let path: String = "/3/gallery/search/"
        return baseURL + path
    }
    
    var headers: [String : String] {
        ["clientID": clientID]
    }
    
    var queryItems: [String : String] {
        ["q": "cats"]
    }
        
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Cat] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(CatsResponse.self, from: data)
        return response.results
    }
}
