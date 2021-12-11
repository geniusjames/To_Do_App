//
//  MainCoordinator.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit

class MainCoordinator: Coordinator{
    
    
       
    var children: [Coordinator]? = nil
    var navigationController: UINavigationController?  = UINavigationController()

    private let window: UIWindow

    init(window: UIWindow ) {
        self.window = window
    }
    
   
    func eventOccurred(with type: Event) {
        switch type {
            
       
        case .todo:
            print("todo screen")
        case .detail:
            print("detail screen")
        }
    }
    
    func start() {
        
       let firstTime = false
        
        if firstTime {
            showTodoScreen()
            
        }
        else {
            showOnboardingScreen()
        }
        
    
    }
    
    func showOnboardingScreen() {
        let onboardingController = onBoardingViewController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        onboardingController.coordinator = self
        navigationController?.setViewControllers([onboardingController], animated: false)
       
    }
    
    func showTodoScreen() {
        let todoViewController = TodoViewController()
    
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        todoViewController.coordinator = self
        navigationController?.setViewControllers([todoViewController], animated: false)
       
    }
    
    
    
    
}


