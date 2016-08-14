//
//  AppDelegate.swift
//  PokeLab
//
//  Created by Chau Vo on 8/14/16.
//  Copyright © 2016 Chau Vo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.

    setupNotification(application)
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }

  //--------------------------------------
  // MARK: - Local Notification
  //--------------------------------------

  func setupNotification(application: UIApplication) {
    let catchAction = UIMutableUserNotificationAction()
    catchAction.identifier = "CATCH"
    catchAction.title = "Catch Pokemon"

    let ignoreAction = UIMutableUserNotificationAction()
    ignoreAction.identifier = "IGNORE"
    ignoreAction.title = "IGNORE"
    ignoreAction.activationMode = .Background
    ignoreAction.destructive = true

    let category = UIMutableUserNotificationCategory()
    category.identifier = "POKEMON_CATEGORY"
    category.setActions([ignoreAction, catchAction], forContext: .Default)
    category.setActions([ignoreAction, catchAction], forContext: .Minimal)

    let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: NSSet(array: [category]) as? Set<UIUserNotificationCategory>)
    application.registerUserNotificationSettings(notificationSettings)
  }

  func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
    if identifier == "CATCH" {
      if let selectedIndex = notification.userInfo![selectedIndexKey] as? Int {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(selectedIndex, forKey: selectedIndexKey)

        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CatchViewController") as? CatchViewController {
          window?.rootViewController?.presentViewController(vc, animated: true, completion: nil)
        }
      }
    }

    // Per developer documentation, app will terminate if we fail to call this
    completionHandler()
  }

}
