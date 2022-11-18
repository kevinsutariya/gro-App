//
//  AppDelegate.swift
//  GroApp
//
//  Created by Faisal Saleem on 22/09/2022.
//

import UIKit
//import FacebookCore
import SCSDKLoginKit
import SSTwitterLogin


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TwitterLoginHelper.sharedInstance.twitterStartwith(consumerKey: TwitterConstants.CONSUMER_KEY, consumerSecret: TwitterConstants.CONSUMER_SECRET_KEY)

//        ApplicationDelegate.shared.application(
//                    application,
//                    didFinishLaunchingWithOptions: launchOptions
//                )
       // SCSDKSnapKit.initSDK()
        
        return true
    }
    
//    func application(
//            _ app: UIApplication,
//            open url: URL,
//            options: [UIApplication.OpenURLOptionsKey : Any] = [:]
//        ) -> Bool {
//            ApplicationDelegate.shared.application(
//                app,
//                open: url,
//                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
//            )
//
//        }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return TwitterLoginHelper.sharedInstance.twitterConfigurationWithOptions(app,open: url, options:options)
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


struct TwitterConstants {
    
    static let CONSUMER_KEY = "Q7kybcdAsDeJHj6ERoLDdDYzm"
    static let CONSUMER_SECRET_KEY = "ADgVMKyjy2USILUPqXFBSQzI24TyvdZGEcq8okkConK2biw5Ol"
    static let CALLBACK_URL = "twitterkit-Q7kybcdAsDeJHj6ERoLDdDYzm"
}
