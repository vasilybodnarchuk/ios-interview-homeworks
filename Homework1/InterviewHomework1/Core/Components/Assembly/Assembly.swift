//
//  Assembly.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

class Assembly {
    private weak var router: Routerable!
    private var itunesService: ItunesServiceable!
    private var networkManager: NetworkManagerable!

    init(router: Routerable) {
        self.router = router
    }
}

// MARK: Assemblyable

extension Assembly: Assemblyable {
    func create(viewController: ViewControllerType) -> UIViewController {
        switch viewController {
        case .root:
            return RootViewController(router: router,
                                      itunesService: getItunesService())
        case .appLoad:
            return AppLoadingViewController(router: router)
        }
    }
}

// MARK: Itunes Service and Repository

private extension Assembly {
    func getItunesService() -> ItunesServiceable {
        if itunesService == nil {
            itunesService = ItunesService(repository: createItunesRepository())
        }
        return itunesService
    }
    
    func createItunesRepository() -> ItunesRepositoryable {
        ItunesRepository(networkManager: getNetworkManager())
    }
}

// MARK: NetworkManager

private extension Assembly {
    func getNetworkManager() -> NetworkManagerable {
        if networkManager == nil {
            networkManager = NetworkManager()
        }
        return networkManager
    }
}
