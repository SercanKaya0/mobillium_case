//
//  MoviesNowPlaying.swift
//  DataSource
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation
public struct MoviesNowPlayingRequest: APIDecodableResponseRequest {
    
    
    
    public typealias ResponseType = MovieNowPlaying?
    
    public var path: String = "/movie/now_playing"
    public var method: RequestMethod = RequestMethod.get
  
    
    public init() {
    }
    
}
