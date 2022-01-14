//
//  MovieNowPlaying.swift
//  DataSource
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation


public struct MovieNowPlaying : Decodable{
    public var dates : MovieNowPlayingDates?
    public var page : Int?
    public var results : [MovieNowPlayingResult]?
    public var totalPages : Int?
    public var totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        
    }
    
}

public struct MovieNowPlayingResult : Decodable {
    public var adult : Bool?
    public var backdropPath : String?
    public var genreIDS : [Int]?
    public var id : Int?
    public var orginalLanguage : String?
    public var originalTitle : String?
    public var overview : String?
    public var popularity: Double?
    public var poster_path : String?
    public var releaseDate : String?
    public var title : String?
    public var video: Bool?
    public var voteAvareage : Double?
    public var voteCount : Int?
    
    enum CodingKeys: String, CodingKey {
       case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS  = "genre_ids"
        case id  = "id"
        case orginalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAvareage = "vote_average"
        case voteCount = "vote_count"
        
    }
    
}

public struct MovieNowPlayingDates : Decodable {
    public var maximum,minimum: String?
}
