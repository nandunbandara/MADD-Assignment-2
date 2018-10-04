//
//  ApiService.swift
//  MADD-Assignment-2
//
//  Created by Isuru Prasad on 10/3/18.
//  Copyright © 2018 Nandun Bandara. All rights reserved.
//


import Alamofire

class API {
    
    static func fetchApplications(_ term: String, limit: Int, entity: String, completion: @escaping ([Application]?) -> Void) {
        print("fetch applications called")
        guard let url = URL(string: "https://itunes.apple.com/search?term=puzzle&limit=20&entity=software") else {
            completion(nil)
            return
        }
        Alamofire.request(url,
                          method: .get,
                          parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value as? [String: Any] else {
                    completion(nil)
                    return
                }
                
                guard let results = value["results"] as? [[String: Any]] else {
                    completion(nil)
                    return
                }
                
                var applications: [Application] = []
                for app in results {
                    let application = Application(app)
                    applications.append(application)
                }
                
                completion(applications)
        }
    }
}
