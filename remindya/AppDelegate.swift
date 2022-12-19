//
//  AppDelegate.swift
//  remindya
//
//  Created by aldinugroho on 19/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.customcolor.appcolor
        let view = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = view
        return true
    }
}
