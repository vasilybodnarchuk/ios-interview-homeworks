//
//  ItunesElement.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 5/9/23.
//

import Foundation

enum ItunesElement: Codable {
    case audioVideo(AudioVideo)
    case error(DecodingError)
    
    enum DecodingError: Error {
        case decoding(error: Error)
    }
}

// MARK: Decodable

extension ItunesElement {
    init(from decoder: Decoder) throws {
        do {
            let value = try decoder.singleValueContainer().decode(AudioVideo.self)
            self = .audioVideo(value)
        } catch let err {
            self = .error(.decoding(error: err))
        }
    }
}


// MARK: Encodable

extension ItunesElement {
    func encode(to encoder: Encoder) throws {
        // TODO:!!!!
    }
}
