//
//  MainTab.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2021/10/19.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            
            HomeRootView().tabItem {
                Image(systemName: "house.circle")
                Text("首页")
            }
            
            SettingRootView().tabItem {
                Image(systemName: "gear.circle")
                Text("设置")
            }
            
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
