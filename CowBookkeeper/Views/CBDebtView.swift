//
//  CBDebtView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/28.
//

import SwiftUI
import SwiftUICharts


struct CBDebtView: View {
    
    
    
    var body: some View {
        ZStack{
            WaveView(color: .blue.opacity(0.5), amplify: 150, isReverse: false)
            WaveView(color: .blue.opacity(0.6), amplify: 100, isReverse: true)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
            
//        NavigationView {
//            ScrollView(.vertical) {
//                WaveView(color: .blue, amplify: 150)
//            }
//            .navigationTitle(AppModuleType.debt.title)
//        }
    }
    
}

struct CBDebtView_Previews: PreviewProvider {
    static var previews: some View {
        CBDebtView()
    }
}

struct WaveView: View {
    var color: Color
    var amplify: CGFloat
    var isReverse: Bool
    
    var body: some View {
        TimelineView(.animation) { timeLine in
            Canvas{ context, size in
                let timeNow = timeLine.date.timeIntervalSinceReferenceDate
                
                let angle = timeNow.remainder(dividingBy: 2)
                
                let offset = angle * size.width
                
//                context.draw(Text("angle:\(angle),offset:\(offset)"), at: CGPoint(x: size.width / 2, y: 100))
                
                context.translateBy(x: isReverse ? -offset : offset, y: 0)
                context.fill(path(size: size), with: .color(color))
                context.translateBy(x: -size.width, y: 0)
                context.fill(path(size: size), with: .color(color))
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(path(size: size), with: .color(color))
                
            }
            .frame(width: 400, height: 400)
//            .cornerRadius(40)
        }
    }
    
    func path(size: CGSize) -> Path {
        return Path { path in
            let midHeight = size.height / 2
            let width = size.width
            
            path.move(to: CGPoint(x: 0, y: midHeight))
            path.addCurve(to: CGPoint(x: width, y: midHeight), control1: CGPoint(x: width * 0.5, y: midHeight + amplify), control2: CGPoint(x: width * 0.5, y: midHeight - amplify))
            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
        }
    }
}
