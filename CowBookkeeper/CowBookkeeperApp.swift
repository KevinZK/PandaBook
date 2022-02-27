//
//  CowBookkeeperApp.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2021/10/14.
//

import SwiftUI

@main
struct CowBookkeeperApp: App {
    @Environment(\.scenePhase) var scenPhase
    @Environment(\.colorScheme) var colorScheme
    
    /// [ApplicationDelegatesapplication(_:didFinishLaunchingWithOptions:)]
    init() {
        print("CowBookkeeper application is starting up. App initialiser.")
    }
    
    var body: some Scene {
        WindowGroup {
//            MainTab()
//            CBFirstUseView()
            
            CBHomeView()
                /// openURL [application(_:open:options:)]
                .onOpenURL { url in
                    print("Received URL: \(url)")
                }
        }
        /// App Life Cycle
        .onChange(of: scenPhase) { newScenPhase in
            switch newScenPhase{
            case .active:
                print("CowBookkeeperApp is Active")
            case .inactive:
                print("CowBookkeeperApp is Inactive")
            case .background:
                print("CowBookkeeperApp is Background")
                @unknown default :
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
        
        
    }
}
