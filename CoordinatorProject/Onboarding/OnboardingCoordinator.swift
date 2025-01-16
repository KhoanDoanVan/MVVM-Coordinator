//
//  Untitled.swift
//  CoordinatorProject
//
//  Created by Đoàn Văn Khoan on 15/1/25.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {
    
    var rootviewController = UIViewController()
    
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView() { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        
        rootviewController = UIHostingController(rootView: view)
    }
}
