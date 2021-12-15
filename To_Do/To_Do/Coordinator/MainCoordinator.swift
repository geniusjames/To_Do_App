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
    
   
    func eventOccurred(with type: Event, todoId:Int) {
        switch type {
            
        
        case .todo:
            print("todo screen")
        case .detail:
            let vc = ViewController()
            vc.todoId = todoId
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        case .todolist:
            let vc = TodoViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func start() {
        
        let firstTime = UserDefaults.standard.value(forKey: "isFirstTime") ?? false
        
        if  firstTime as! Bool {
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


