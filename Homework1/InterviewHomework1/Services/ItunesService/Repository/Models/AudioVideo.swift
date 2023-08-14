//
//  AudioVideo.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 5/9/23.
//

import Foundation

struct AudioVideo: Codable {
    let artistName: String
    let kind: DecodableEnum<Kind>
}

extension AudioVideo {
    enum Kind: String, Codable {
        case song, podcast
        case featureMovie = "feature-movie", tvEpisode = "tv-episode"
    }
}

