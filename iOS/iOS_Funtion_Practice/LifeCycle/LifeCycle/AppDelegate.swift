//
//  AppDelegate.swift
//  LifeCycle
//
//  Created by Ick on 2021/02/03.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("준비가 끝남")
        return true
    }
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("준비가 곧 끝남")
        return true
    }
//    func applicationWillTerminate(_ application: UIApplication) {
//        print("앱이 곧 종료됩니다")
//    }
    func applicationWillResignActive(_ application: UIApplication) {
        print("앱이 active 상태를 포기합니다")
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("앱이 Active 상태가 되었습니다")
    }
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("앱이 launching을 완료했습니다")
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("앱이 background 상태가 됩니다")
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("앱이 foreground 상태가 됩니다")
    }
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

