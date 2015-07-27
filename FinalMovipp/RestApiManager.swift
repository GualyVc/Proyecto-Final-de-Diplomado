//
//  RestApiManager.swift
//  FinalMovipp
//
//  Created by internet on 7/23/15.
//  Copyright (c) 2015 Gualy Vc. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
   
    static let sharedInstance = RestApiManager()
    
    let baseURL = "http://api.themoviedb.org/3/movie/upcoming?api_key=c74f6f5dd261c2da05cb3105bcdd4d58"
    
    func getRandomUser(onCompletion: (JSON) -> Void) {
        makeHTTPRequest(baseURL, onCompletion: { json, err -> Void in
            onCompletion(json)
        })
    
    }
    
    func makeHTTPRequest(path: String, onCompletion: ServiceResponse) {
    
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error in
            let json:JSON = JSON(data: data)
            onCompletion(json, error)
        })
        
        task.resume()
    }

}
