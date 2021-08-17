//
//  AppDelegate.swift
//  douyu
//
//  Created by James on 2021/8/7.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let root = ZJTabBarController()
        self.window?.rootViewController = root
//        UIApplication.shared.statusBarStyle = .lightContent
        var cookieProperties = [HTTPCookiePropertyKey: String]()
        cookieProperties[HTTPCookiePropertyKey.name] = "acf_did" as String
        cookieProperties[HTTPCookiePropertyKey.value] = "3ee82da474009d4e89ced25300001621" as String
        cookieProperties[HTTPCookiePropertyKey.domain] = "https://apiv3.douyucdn.cn" as String
        cookieProperties[HTTPCookiePropertyKey.path] = "/" as String
        
        
        let cookie = HTTPCookie(properties: cookieProperties)
        HTTPCookieStorage.shared.setCookie(cookie!)
        
        let cookieArray = HTTPCookieStorage.shared.cookies!
        for cookie in cookieArray
        {
            print("name:\(cookie.name),value:\(cookie.value)")
        }
//        if let cookieArray = UserDefaults.standard.array(forKey: "ZJ_DOUYU_TOKEN") {
//            for cookieData in cookieArray {
//                if let dict = cookieData as? [HTTPCookiePropertyKey : Any] {
//                    if let cookie = HTTPCookie.init(properties : dict) {
//                        HTTPCookieStorage.shared.setCookie(cookie)
//                    }
//                }
//            }
//        }
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    
//    @available(iOS 13.0, *)
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    @available(iOS 13.0, *)
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//

}

