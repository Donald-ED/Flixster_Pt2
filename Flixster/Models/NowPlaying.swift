//
//  NowPlaying.swift
//  Flixster
//
//  Created by Donald Echefu on 3/11/23.
//

import Foundation

struct NowPlayingResponse: Decodable {
    let results: [NowPlaying]
}

struct NowPlaying: Decodable {
    let title: String
    let overview: String
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    let release_date: String
    
    var artworkUrl100: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")!
    }
    enum NowPlaying: String, CodingKey {
        case title
        case overview
        case poster_path
        case vote_average
        case vote_count
        case popularity
        case release_date
    }
}
