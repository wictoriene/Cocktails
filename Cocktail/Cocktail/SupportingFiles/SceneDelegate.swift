//
//  SceneDelegate.swift
//  Cocktail
//
//  Created by wictoriene on 2.03.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        configureNavBar()
        window?.windowScene = windowScene
        
        
        let launchController = ViewController()
        launchController.completion = { [weak self] in
            let launchController = UINavigationController(rootViewController: CategoriesVC())
            self?.window?.rootViewController = launchController
            self?.window?.rootViewController = launchController
        }
        
        window?.rootViewController =  launchController
        window?.makeKeyAndVisible()

        
        
    }

    private func configureNavBar() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.shadowColor = .white
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            UINavigationBar.appearance().tintColor = UIColor(red: 101/255, green: 104/255, blue: 173/255, alpha: 1)
        }
    }

}

