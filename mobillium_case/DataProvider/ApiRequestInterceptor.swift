//
//  ApiRequestInterceptor.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation
import Alamofire
public class APIRequestInterceptor: RequestInterceptor{
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDJhMmVjMzY2NmZjZDZkMDc1OWFjN2JlMmVhZTVjYSIsInN1YiI6IjYwN2Q4MjdjOWYzN2IwMDAyOWIwOGZmYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wDh5Gm3mV96s0zzivyloKrtIRc1_B0UQZUdr5Hsc9Xc"
        
        
            urlRequest.headers.add(name: "Authorization", value: "Bearer \(accessToken)")
        

        completion(.success(urlRequest))
    }
}
