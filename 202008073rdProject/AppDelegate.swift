//
//  AppDelegate.swift
//  202008073rdProject
//
//  Created by Dustin on 2020/08/07.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    let defaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //잘못 지정되면 시작점이 두개가 될 수도 있다
        
        if #available(ios 13.0, *) {
            
        } else {
            
                if defaults.object(forKey: "userStatus") as? Int != nil {
                   if UserStatus(rawValue: defaults.integer(forKey: "userStatus"))! == .normal {
                       // _ -> 와일드 카드 식별자
                       
                       
                       //1.코드로 엔트리 포인트
                       
                      
                       //2. 시작하고자 하는 viewcontroller 지정
                       
                       let vc = ViewController()
                       let nav = UINavigationController(rootViewController: vc)
                       window?.rootViewController = nav
                       window?.makeKeyAndVisible()
                       
                   } else {
                       
            
                       
                       let vc = SignUpViewController()
                       let nav = UINavigationController(rootViewController: vc)
                       window?.rootViewController = nav
                       window?.makeKeyAndVisible()
                       
                   }
                   
                   
               } else {
                   

                   
                   let vc = SignUpViewController()
                   let nav = UINavigationController(rootViewController: vc)
                   window?.rootViewController = nav
                   window?.makeKeyAndVisible()
                   
               }
            
        }
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

