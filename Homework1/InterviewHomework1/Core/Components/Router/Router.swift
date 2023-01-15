//
//  Router.swift
//  TestApp1
//
//  Created by Vasily Bodnarchuk on 12/6/22.
//

import UIKit

class Router {
    private var window: UIWindow!
    private weak var delegate: RouterDelegate!
    init(delegate: RouterDelegate) {
        self.delegate = delegate
    }
}

// MARK: Routerable

extension Router: Routerable {
    
    func navigate(path: RouterPath) {
        switch path {
        case .setRoot(let type):
            window.rootViewController = delegate.create(viewController: type)
        }
    }
}


// MARK: CoreRouterable

extension Router: CoreRouterable {
    func renderRootController(scene: UIScene,
                              willConnectTo session: UISceneSession,
                              options connectionOptions: UIScene.ConnectionOptions) {
        window = UIWindow(windowScene: UIWindowScene(session: session,
                                                     connectionOptions: connectionOptions))
        window.rootViewController = delegate.create(viewController: .appLoad)
        window.makeKeyAndVisible()
    }
}
