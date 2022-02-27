//
//  Animations.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/23.
//

import SwiftUI

struct Animations: View {
    @State private var offset: Double = 0

        var body: some View {
            Button(action: {}) { Text("Button") }
                .offset(x: 0.0, y: offset)
                .onAppear {
                    withAnimation(.default) {
                        self.offset = 100.0 }
                }
        }
}

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
