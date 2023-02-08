//
//  AppDelegate.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var router: AppRoutable?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router = AppRouter()
        
        AppCore.shared.prepareSession()
        
        routeToInitialScene()
        
        return true
    }

    private func routeToInitialScene() {
        router?.routeToInitialScene()
    }
}
