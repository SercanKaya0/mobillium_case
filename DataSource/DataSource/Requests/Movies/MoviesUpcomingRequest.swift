//
//  MoviesUpcomingRequest.swift
//  DataSource
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation
public struct MoviesUpcomingRequest: APIDecodableResponseRequest {
    
    
    
    public typealias ResponseType = MovieNowPlaying?
    
    public var path: String = "/movie/upcoming"
    public var parameters: RequestParameters = [:]
    public var method: RequestMethod = RequestMethod.get
  
    
    public init(page: Int?) {
        parameters["page"] = page
    }
    
}
