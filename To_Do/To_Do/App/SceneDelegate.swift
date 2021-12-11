//
//  SceneDelegate.swift
//  To_Do
//
//  Created by Geniusjames on 11/12/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        self.window = appWindow
        appWindow.backgroundColor = .systemBackground
        AppDelegate.standard.window = appWindow
        let coordinator = MainCoordinator(window: appWindow)
        coordinator.start()
    }

   
}

