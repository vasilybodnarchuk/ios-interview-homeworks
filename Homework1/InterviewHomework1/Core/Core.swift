//
//  Core.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 1/6/23.
//

import UIKit

class Core {
    private var assembly: Assembly
    private var router: Routerable
    
    init() {
        assembly = Assembly()
        router = Router(assembly: assembly)
        assembly.set(router: router)
    }
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        router.renderRootController(scene: scene, willConnectTo: session, options: connectionOptions)
    }
}

