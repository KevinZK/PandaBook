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
//        ZStack{
//            WaveView(color: AppModuleType.debt.bgColor, isReverse: false, radius: 80, progress: 0.56)
//        }
//        .ignoresSafeArea(.all, edges: .bottom)
        
            ScrollView(.vertical) {
                VStack {
                    Text("￥35600.6")
                        .font(.system(size: 50))
                        .bold()
                        .padding(.trailing, 40)
                        .foregroundColor(.white)
                    Text("总" + AppModuleType.debt.title)
                        .foregroundColor(.white)
                }
                .frame(width: ScreenW*0.93, height: 120)
                .background(Color(hex: 0x073B4C))
                .cornerRadius(20)
                
            }
            .navigationTitle(AppModuleType.debt.title)
    }
    
}

struct CBDebtView_Previews: PreviewProvider {
    static var previews: some View {
        CBDebtView()
    }
}

struct WaveView: View {
    var color: Color
    var isReverse: Bool
    var radius: CGFloat
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            WavePathView(color: color, isReverse: false, radius: radius, progress: progress)
            Text("\(progress * 100, specifier: "%.1f")%")
                .bold()
        }
        .frame(width: radius * 2, height: radius * 2)
        .cornerRadius(radius)
        .overlay {
            Circle().stroke(.gray.opacity(0.2), lineWidth: 1)
        }
    }
    
}

struct WavePathView: View {
    var color: Color
    var isReverse: Bool
    var radius: CGFloat
    var progress: CGFloat
    
    var body: some View {
        TimelineView(.animation) { timeLine in
            Canvas{ context, size in
                let timeNow = timeLine.date.timeIntervalSinceReferenceDate
                
                let angle = timeNow.remainder(dividingBy: 2)
                
                let offset = angle * size.width
                
                context.translateBy(x: isReverse ? -offset : offset, y: 0)
                context.fill(path(size: size), with: .linearGradient(Gradient(colors: [.white, color]), startPoint: CGPoint(x: size.width/2, y: size.height), endPoint: CGPoint(x: size.width/2, y: 0.0)))
                context.translateBy(x: -size.width, y: 0)
                context.fill(path(size: size), with: .linearGradient(Gradient(colors: [.white, color]), startPoint: CGPoint(x: size.width/2, y: size.height), endPoint: CGPoint(x: size.width/2, y: 0.0)))
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(path(size: size), with: .linearGradient(Gradient(colors: [.white, color]), startPoint: CGPoint(x: size.width/2, y: size.height), endPoint: CGPoint(x: size.width/2, y: 0.0)))
                
            }
            
        }
    }
    
    func path(size: CGSize) -> Path {
        let amplify = radius / 2.0
        return Path { path in
            let midHeight = size.height * (1 - progress)
            let width = size.width
            let offset = progress <= 0.5 ? progress/0.5 : (1 - progress)/0.5
            path.move(to: CGPoint(x: 0, y: midHeight))
            path.addCurve(to: CGPoint(x: width, y: midHeight), control1: CGPoint(x: width * 0.5, y: midHeight + amplify * offset), control2: CGPoint(x: width * 0.5, y: midHeight - amplify * offset))
            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
        }
    }
}
