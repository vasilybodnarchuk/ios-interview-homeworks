//
//  ItunesService.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 2/8/23.
//

import Foundation

class ItunesService {
    private let repository: ItunesRepositoryable

    init (repository: ItunesRepositoryable) {
        self.repository = repository
    }
}

// MARK: ItunesServiceable

extension ItunesService: ItunesServiceable {
    
}
