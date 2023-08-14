//
//  ServiceAssembly.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 8/13/23.
//

import Foundation

// MARK: ServiceAssemblyable

protocol ServiceAssemblyable {
    func getItunesService() -> ItunesServiceable
}

// MARK: ServiceAssemblyDelegate

protocol ServiceAssemblyDelegate: AnyObject {
    func getNetworkManager() -> NetworkManagerable
}

class ServiceAssembly {
    private var itunesService: ItunesServiceable!
    private weak var delegate: ServiceAssemblyDelegate!
    init (delegate: ServiceAssemblyDelegate) {
        self.delegate = delegate
    }
}

// MARK: ServiceAssemblyable confirmation

extension ServiceAssembly: ServiceAssemblyable {
    func getItunesService() -> ItunesServiceable {
        if itunesService == nil {
            itunesService = ItunesService(repository: createItunesRepository())
        }
        return itunesService
    }
    
    func createItunesRepository() -> ItunesRepositoryable {
        ItunesRepository(networkManager: delegate.getNetworkManager())
    }
}

