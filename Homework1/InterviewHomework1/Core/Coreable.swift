//
//  Coreable.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 1/14/23.
//

import SwiftUI

protocol Coreable: AnyObject {
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions)
}
