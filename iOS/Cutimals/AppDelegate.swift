//
//  AppDelegate.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/29/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var cutimalsCoordinator: CutimalsCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()

        let rootNavigationController = UINavigationController()
        cutimalsCoordinator = CutimalsCoordinator(navigationController: rootNavigationController)
        cutimalsCoordinator?.start()

        window?.rootViewController = rootNavigationController

        return true
    }
}


//1. Create List of Animals - local data, json
//2. Pull & decode animal objects into models
//3. Display list of animals - collection view with custom cells

//4. Display animal details on tap -


