//
//  CoreAssembly.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 8/13/23.
//

import Foundation

protocol CoreAssemblyable {
    func getNetworkManager() -> NetworkManagerable
}

class CoreAssembly {
    private var networkManager: NetworkManagerable!
}

// MARK: CoreAssemblyable

extension CoreAssembly: CoreAssemblyable {
    func getNetworkManager() -> NetworkManagerable {
        if networkManager == nil {
            networkManager = NetworkManager()
        }
        return networkManager
    }
}
