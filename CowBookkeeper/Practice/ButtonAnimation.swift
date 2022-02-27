//
//  ButtonAnimation.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/23.
//

import SwiftUI

struct ButtonAnimation: View {
    
    var body: some View {
        
        ZStack {
            Color(hex: 0xFFBE0B).ignoresSafeArea()
            CommandButton(offset: UnitPoint(x: -70, y: -250)) { type in
                
            }
        }
    }
}

struct ButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAnimation()
    }
}


