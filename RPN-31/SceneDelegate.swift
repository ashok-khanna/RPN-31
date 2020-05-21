//
//  SceneDelegate.swift
//  TimeTracker
//
//  Created by Ashok Khanna on 8/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Here we are defining a "Global" class object that we will access throughout the program
        // For now we are defining the display parameters as constant, however later we should set these based on the device (i.e. customise for iPad, various iPhone sizes, etc.)
        
        // Connecting our global variable to the main entry point of the program (ContentView)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            var gapWidthPortrait = CGFloat(0.2)
            var gapWidthLandscape = CGFloat(0.17)
            var adjustmentFactorPortrait = CGFloat(1)
            var adjustmentFactorLandscape = CGFloat(0.25)
            var isPad = false
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                
                gapWidthPortrait = CGFloat(0.17)
                gapWidthLandscape = CGFloat(0.1)
                adjustmentFactorPortrait = CGFloat(0.7)
                adjustmentFactorLandscape = CGFloat(0.35)
                isPad = true
                
            }
            
            let dataRouter = DataRouter(isPad: isPad, numCols: CGFloat(4), numRows: CGFloat(5), gapWidthPortrait: gapWidthPortrait, gapWidthLandscape: gapWidthLandscape, adjustmentFactorPortrait: adjustmentFactorPortrait, adjustmentFactorLandscape: adjustmentFactorLandscape, isLandscape: windowScene.interfaceOrientation.isLandscape)
            let contentView = ContentView().environmentObject(dataRouter)

            window.rootViewController = HostingController(rootView: AnyView(contentView))
            self.window = window
            window.makeKeyAndVisible()
        }
        // Use a UIHostingController as window root view controller. This is different to the usual SwiftUI setup (create a blank SwiftUI project and compare the code differences
        // The reason for this modification is allow the top status bar to have white text (we will later make its background black), nothing more
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

