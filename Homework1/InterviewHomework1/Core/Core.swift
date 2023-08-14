//
//  Core.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 1/6/23.
//

import UIKit

class Core {
    private var assembly: Assembly!
    private var router: CoreRouterable!
    
    init() {
        router = Router(delegate: self)
        assembly = Assembly(router: router)
    }
}

// MARK: Coreable

extension Core: Coreable {
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        router.renderRootController(scene: scene, willConnectTo: session, options: connectionOptions)
    }
}

// MARK: RouterDelegate

extension Core: RouterDelegate {
    func create(viewController: ViewControllerType) -> UIViewController {
        assembly.create(viewController: viewController)
    }
}