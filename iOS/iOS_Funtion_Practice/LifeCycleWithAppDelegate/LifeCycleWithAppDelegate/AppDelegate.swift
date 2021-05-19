//
//  AppDelegate.swift
//  LifeCycleWithAppDelegate
//
//  Created by Ick on 2021/05/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate : 앱이 곧 종료됩니다.")
    }
    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillResignActive : 앱이 Active 상태를 포기하고 In-Active 상태가 됩니다.")
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive : 앱이 Active 상태가 되었습니다")
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground : 앱이 In-Active -> Background 상태가 됩니다")
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground : 앱이 Background -> Foreground 상태가 됩니다")
    }
}

