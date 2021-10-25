//
//  AppDelegate.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/25.
//

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
