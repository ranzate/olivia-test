//
//  AppDelegate.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        guard !isRunningUnitTests else {
            window = nil
            return true
        }
        
        setupDependencies()
    
        
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
    
    func setupDependencies() {
        Dependencies.shared.add({ NetworkProvider() as NetworkProviderProtocol })
        Dependencies.shared.add({ ProductRepository() as ProductRepositoryProtocol })
        Dependencies.shared.add({ GetProductsUseCase() })
        Dependencies.shared.add({ ApplyDiscountUseCase([TwoForOneDiscountStrategy(), BulkPurchasesDiscountStrategy()]) })
    }
    
    private var isRunningUnitTests: Bool {
        let env = ProcessInfo.processInfo.environment
        print("ENV KEYS: \(env.keys)")
        return env.keys.contains("XCInjectBundleInto")
    }

}

