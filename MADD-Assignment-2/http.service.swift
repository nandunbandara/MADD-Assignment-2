//
//  http.service.swift
//  MADD-Assignment-2
//
//  Created by SE on 9/30/18.
//  Copyright © 2018 Isuru Prasad. All rights reserved.
//

import Foundation


func getdata(url: String){

    let currentTerm = "puzzle";
    let currentLimit = 200;
    let currentEntity = "software";
    
    let constants = Constants();
    guard let url = URL( string: constants.getSearchApiUrl( term:currentTerm, limit:currentLimit, entity:currentEntity )) else { return }
    
    let session  = URLSession.shared
    session.dataTask(with: url) { (data, response, error) in
        
//        check response
        if let  response = response {
            print (response)
        }
        
//        check data
        if let data = data {
            print (data)
        }
        }.resume();
}
