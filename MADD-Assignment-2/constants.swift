//
//  constants.swift
//  MADD-Assignment-2
//
//  Created by SE on 9/30/18.
//  Copyright © 2018 Isuru Prasad. All rights reserved.
//

import Foundation

class Constants {
    
    func getSearchApiUrl (term:String, limit:Int, entity:String) -> String{
        
        var url = "https://itunes.apple.com/search?term=" + term +
            "&limit=" + limit + "&entity=" + entity;
        
        return url;
    }
}
