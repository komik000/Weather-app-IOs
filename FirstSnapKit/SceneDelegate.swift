//
//  SceneDelegate.swift
//  FirstSnapKit
//
//  Created by Yessimkhan Zhumash on 17.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = WeatherViewController() // Your initial view controller.
        window?.makeKeyAndVisible()
    }

    


}

