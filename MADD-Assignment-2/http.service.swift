//
//  http.service.swift
//  MADD-Assignment-2
//
//  Created by SE on 9/30/18.
//  Copyright © 2018 Isuru Prasad. All rights reserved.
//

import Foundation


func getdata(url: String){

    let term = "puzzle";
    let limit = 200;
    let entity = "software";
    
    guard let url = URL(string: Constants.getSearchApiUrl(term,limit,entity))
}
