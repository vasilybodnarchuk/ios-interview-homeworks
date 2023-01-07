//
//  Router.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

class Router {
    private var window: UIWindow!
    private weak var assembly: Assemblyable!
    init(assembly: Assemblyable) {
        self.assembly = assembly
    }
}

// MARK: Routerable

extension Router: Routerable {
    func renderRootController(scene: UIScene,
                              willConnectTo session: UISceneSession,
                              options connectionOptions: UIScene.ConnectionOptions) {
        window = UIWindow(windowScene: UIWindowScene(session: session,
                                                     connectionOptions: connectionOptions))
        window.rootViewController = assembly.create(viewController: .appLoad)
        window.makeKeyAndVisible()
    }
    
    //func route(to )
}
