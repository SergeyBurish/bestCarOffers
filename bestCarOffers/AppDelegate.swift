//
//  AppDelegate.swift
//  bestCarOffers
//
//  Created by Sergey Burish on 08.12.2022.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let appDependencies = AppDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appDependencies.installRootViewControllerIntoWindow(window!)
        
        return true
    }
}

