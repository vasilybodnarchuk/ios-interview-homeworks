//
//  Routerable.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

protocol Routerable: AnyObject {
    func renderRootController(scene: UIScene,
                              willConnectTo session: UISceneSession,
                              options connectionOptions: UIScene.ConnectionOptions)
    func navigate(path: RouterPath)
}

enum RouterPath {
    case setRoot(type: ViewControllerType)
}
