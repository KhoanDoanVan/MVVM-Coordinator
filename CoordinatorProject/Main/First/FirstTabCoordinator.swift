//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Đoàn Văn Khoan on 15/1/25.
//

import Foundation
import UIKit
import SwiftUI

class FirstTabCoordinator: NSObject, Coordinator {
    
    var rootViewController: UINavigationController
    let viewModel = FirstTabViewModel()
    
    override init() {
        self.rootViewController = UINavigationController()
        self.rootViewController.navigationBar.prefersLargeTitles = true
        
        super.init()
        /// Track state or shown
        rootViewController.delegate = self
    }
    
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
        vc.title = "First"
        return vc
    }()
    
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToDetail() {
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: false)
    }
}


extension FirstTabCoordinator: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        if viewController as? UIHostingController<FirstDetailView> != nil {
            print("Detail will be shown")
        } else if viewController as? FirstViewController != nil {
            print("First will be shown")
        }
    }
}
