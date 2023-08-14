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

// MARK: Create/Get services

private extension Assembly {
    func getItunesService() -> ItunesServiceable {
        if let itunesService = itunesService {
            return itunesService
        } else {
            let itunesService = ItunesService(repository: createItunesRepository())
            self.itunesService = itunesService
            return itunesService
        }
    }
    
    func createItunesRepository() -> ItunesRepositoryable {
        ItunesRepository()
    }
}
