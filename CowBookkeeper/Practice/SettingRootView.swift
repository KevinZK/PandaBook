//
//  SettingRootView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2021/10/19.
//

import SwiftUI

struct SettingRootView: View {
    var body: some View {
        
        NavigationView {
            ScrollView{
                Text("SettingRootView")
            }
            .navigationTitle("设置")
        }
    }
}

struct SettingRootView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRootView()
    }
}
