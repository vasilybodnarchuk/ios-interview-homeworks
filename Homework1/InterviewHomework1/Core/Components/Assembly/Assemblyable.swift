//
//  Assemblyable.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

protocol Assemblyable: AnyObject {
    func create(viewController: ViewControllerType) -> UIViewController
}

struct AssemblyElement {
    
}

// MARK: ViewController

enum ViewControllerType {
    case root, appLoad
}
