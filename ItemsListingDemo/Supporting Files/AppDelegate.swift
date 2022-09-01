//
//  AppDelegate.swift
//  ItemsListingDemo
//
//  Created by BrainX IOS on 26/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Internal Properties
    
    var window: UIWindow?
    var orientationLock  = UIInterfaceOrientationMask.portrait
    
    // MARK: - Internal Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
}
