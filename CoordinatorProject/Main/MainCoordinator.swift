//
//  MainCoordinator.swift
//  CoordinatorProject
//
//  Created by Đoàn Văn Khoan on 15/1/25.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }
    
    func start() {
        
        /// First tab bar
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        self.childCoordinators.append(firstCoordinator)
        
        let firstViewController = firstCoordinator.rootViewController
        setup(vc: firstViewController, title: "First Tab", imageName: "paperplane", selectedImageName: "paperplane.fill")
        
        /// Second tab bar
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        self.childCoordinators.append(secondCoordinator)
        
        let secondViewController = secondCoordinator.rootViewController
        setup(vc: secondViewController, title: "Second Tab", imageName: "bell", selectedImageName: "bell.fill")
        
        /// set view controller
        self.rootViewController.viewControllers = [firstViewController, secondViewController]
        
    }
    
    func setup(
        vc: UIViewController,
        title: String,
        imageName: String,
        selectedImageName: String
    ) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
