//
//  ItunesResponse.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 5/9/23.
//

import Foundation

struct ItunesResponse: Codable {
    let resultCount: Int
    let results: [ItunesElement]
}
