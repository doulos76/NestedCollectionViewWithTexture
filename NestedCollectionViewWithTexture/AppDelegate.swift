//
//  AppDelegate.swift
//  NestedCollectionViewWithTexture
//
//  Created by seongjong_kim on 04/07/2019.
//  Copyright © 2019 seongjong_kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainVC = RootViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()

        return true
    }
}

