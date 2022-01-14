//
//  MoviesDetailRequest.swift
//  DataSource
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation
public struct MoviesDetailRequest: APIDecodableResponseRequest {
    
    
    
    public typealias ResponseType = MovieDetail?
    
    public var path: String = "/movie/{moviesId}"
    public var method: RequestMethod = RequestMethod.get
  
    
    public init(moviesId: Int) {
        path = "/movie/\(moviesId)"
    }
    
}
