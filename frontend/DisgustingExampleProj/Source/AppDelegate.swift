//
//  AppDelegate.swift
//  StarterProject
//
//  Created by Sacha Durand Saint Omer on 30/01/2017.
//  Copyright © 2017 freshOS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Inject our Api implementation.
        api = InternalApi()

        // Here we're not using storyboards so that's the code needed to show
        // the first ViewController on screen.
        window = UIWindow()
        window?.rootViewController = PhotosVC()
        window?.makeKeyAndVisible()
        return true
    }
}
