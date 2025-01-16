//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by Đoàn Văn Khoan on 15/1/25.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        setupOnboardingValue()
        
        hasSeenOnboarding
            .removeDuplicates() /// Remove values has same value forward
            .sink { [weak self] hasSeen in
                
                if hasSeen {
                    let mainCoordinator = MainCoordinator()
                    mainCoordinator.start()
                    
                    self?.childCoordinators = [mainCoordinator]
                    self?.window.rootViewController = mainCoordinator.rootViewController
                    
                } else if let hasSeenBoarding = self?.hasSeenOnboarding {
                    
                    let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenBoarding)
                    onboardingCoordinator.start()
                    self?.childCoordinators = [onboardingCoordinator]
                    self?.window.rootViewController = onboardingCoordinator.rootviewController
                }
            }
            .store(in: &subscriptions)
        
    }
    
    
    func setupOnboardingValue() {
        /// storing and loading of state/data
        
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) /// Default of false
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter { $0 }
            .sink { value in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions)
    }
}
