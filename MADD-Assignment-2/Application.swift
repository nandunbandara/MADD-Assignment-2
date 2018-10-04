//
//  Application.swift
//  MADD-Assignment-2
//
//  Created by Isuru Prasad on 10/3/18.
//  Copyright © 2018 Nandun Bandara. All rights reserved.
//

class Application {
    
    var name: String?
    var imageUrl: String?
    var description: String?
    var features: [String]?
    var price: Float?
    var avgRating: Float?
    var sellerName: String?
    
    init(_ params: [String: Any]) {
        
        self.name = params["trackName"] as? String
        self.imageUrl = params["artworkUrl60"] as? String
        self.sellerName = params["sellerName"] as? String
        self.price = params["price"] as? Float
        
    }
    
}

