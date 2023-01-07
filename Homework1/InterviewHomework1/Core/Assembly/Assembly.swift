//
//  Assembly.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

class Assembly {
    
}

// MARK: Assemblyable

extension Assembly: Assemblyable {
    func create(viewController: ViewControllerType) -> UIViewController {
        switch viewController {
        case .root:
            return RootViewController()
        }
    }
}
