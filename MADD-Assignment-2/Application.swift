//
//  Application.swift
//  MADD-Assignment-2
//
//  Created by Nandun Bandara on 10/3/18.
//  Copyright © 2018 Nandun Bandara. All rights reserved.
//

class Application {
    
    var name: String?
    var imageUrl: String?
    var description: String?
    var features: [String]?
    var price: Float?
    var avgRating: Float?
    
    init(_ params: [String: Any]) {
        
        self.name = params["trackName"] as? String
        
    }
    
}

