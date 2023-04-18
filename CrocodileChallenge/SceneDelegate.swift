//
//  SceneDelegate.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
              
              // инициализируем наше окно
              window = UIWindow(frame: windowScene.coordinateSpace.bounds)
              window?.windowScene = windowScene
              
              // инициализируем наш главный view controller
              let viewController = TeamViewController()
              let navigationController = UINavigationController(rootViewController: viewController)
              
              window?.rootViewController = navigationController
              window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

