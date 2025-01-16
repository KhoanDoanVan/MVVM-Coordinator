//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by Đoàn Văn Khoan on 15/1/25.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordinator: ApplicationCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            
            self.applicationCoordinator = applicationCoordinator
            
            /// start show window
            window.makeKeyAndVisible()
        }
        
    }

}

