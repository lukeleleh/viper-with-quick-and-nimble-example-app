//
//  AppDelegate.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupInitialModule()
        return true
    }

}

private extension AppDelegate {
    func setupInitialModule() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginViewController = LoginRouter.assembleModule()
        window?.makeKeyAndVisible()
        window?.rootViewController = loginViewController
    }
}

