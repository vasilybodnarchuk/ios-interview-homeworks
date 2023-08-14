//
//  Assembly.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

class Assembly {
    private weak var router: Routerable!
    private lazy var coreAssembly: CoreAssemblyable = CoreAssembly()
    private var serviceAssembly: ServiceAssemblyable!
    init(router: Routerable) {
        self.router = router
        serviceAssembly = ServiceAssembly(delegate: self)
    }
}

// MARK: Assemblyable

extension Assembly: Assemblyable {
    func create(viewController: ViewControllerType) -> UIViewController {
        switch viewController {
        case .root:
            return RootViewController(router: router,
                                      itunesService: serviceAssembly.getItunesService())
        case .appLoad:
            return AppLoadingViewController(router: router)
        }
    }
}

// MARK:  ServiceAssemblyDelegate

extension Assembly: ServiceAssemblyDelegate {
    func getNetworkManager() -> NetworkManagerable {
        coreAssembly.getNetworkManager()
    }
}
