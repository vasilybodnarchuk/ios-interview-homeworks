//
//  Assembly.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

class Assembly {
    private weak var router: Routerable!
    func set(router: Routerable) {
        self.router = router
    }
}

// MARK: Assemblyable

extension Assembly: Assemblyable {
    func create(viewController: ViewControllerType) -> UIViewController {
        switch viewController {
        case .root:
            return RootViewController()
        case .appLoad:
            return AppLoadingViewController(router: router)
        }
    }
}
