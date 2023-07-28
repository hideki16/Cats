//
//  Cat.swift
//  Cats
//
//  Created by gabriel hideki on 27/07/23.
//

import UIKit

public struct CatsResponse: Codable {
    public let data: [Cat]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

public struct Cat {
    public let id: String?
    public let title: String?
    public let images: [Image?]?
    public let link: String?
}

extension Cat: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case images
        case link
    }
}

public struct Image: Codable {
    public let id: String?
    public let title: String?
    public let link: String?
}

extension Image {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case link
    }
}
