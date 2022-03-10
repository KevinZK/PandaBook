//
//  CBFirstUseView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/8.
//

import SwiftUI

struct CBFirstUseView: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 20
        ) {
            Image("first_use_icon")
            
            Text("简单的\n方式管理\n你的Money")
                .font(.system(size: 60, weight: .bold, design: .serif))
                .padding(.top, 60)
            
            Button(action: {
                print("开始记账")
            }){
                HStack {
                    Text("开始")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color.black)
                        .frame(height: 30)
                        .padding(20)
                    
                    Spacer()
                    
                    ZStack {
                        
                        Image(systemName: "arrow.forward")
                            .font(.system(size: 36))
                            .foregroundColor(Color.white)
                            .frame(width: 58,height: 58)
                        
                    }
                    .background(Color(hex: 0xF7C800,alpha: 0.58))
                    .cornerRadius(34)
                    .padding(.trailing)
                    
                    
                }
                
            }
            .buttonStyle(.plain)
            .background(Color(hex: 0xFA6400,alpha: 0.58))
            .cornerRadius(20)
            .padding(.top, 50)
            
            
        }
        .padding(20)
        
    }
}

struct CBFirstUseView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CBFirstUseView()
            
        }
    }
}
