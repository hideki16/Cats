//
//  CatsListRequest.swift
//  Cats
//
//  Created by gabriel hideki on 27/07/23.
//

import Foundation

struct CatsListRequest: DataRequest {
    
    private let clientID: String = "Client-ID 1ceddedc03a5d71"
    private let clientSecret: String = "63775118a9f912fd91ed99574becf3b375d9eeca"

    var url: String {
        let baseURL: String = "https://api.imgur.com"
        let path: String = "/3/gallery/search/"
        return baseURL + path
    }
    
    var headers: [String : String] {
        ["Authorization": clientID]
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
        
        let response = try decoder.decode(CatsResponse.self, from: data)
        return response.data
    }
}
