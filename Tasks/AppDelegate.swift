//
//  AppDelegate.swift
//  Tasks
//
//  Created by Ky Nguyen Coinhako on 5/15/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupApp()
        return true
    }
    
    func setupApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = tkTasksListController()
        window!.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
}

