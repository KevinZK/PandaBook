//
//  CommandButton.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/24.
//

import Foundation
import SwiftUI


struct CommandButton<Content: View>: View  {
    @State private var enable = false
    @State private var actionRotation = 0.0
    @State private var featuresRotation = 180.0
    @State private var debtOffset: UnitPoint = .zero
    @State private var planOffset: UnitPoint = .zero
    @State private var recordOffset: UnitPoint = .zero
    @State private var actionScale = 1.0
    @State private var featuresScale = 0.1
    @State private var blurAlph = 0.0
    @State var debtPresenting = false
    @State var recordPresenting = false
    @State var planPresenting = false
    let offset: UnitPoint
    
    @ViewBuilder let sheetAction: (AppModuleType) -> Content
    
    func executeAnimation() {
        actionRotation   = enable ? 90.0 : 0.0
        featuresRotation = enable ? 0.0 : 180.0
        debtOffset       = enable ? UnitPoint(x: -70, y: -80) : .zero
        recordOffset     = enable ? UnitPoint(x: -100, y: 0) : .zero
        planOffset       = enable ? UnitPoint(x: -70, y: 80) : .zero
        actionScale      = enable ? 0.9 : 1.1
        featuresScale    = enable ? 1.1 : 0.1
        blurAlph         = enable ? 1.0 : 0.0
    }
    
    var body: some View {
        GeometryReader { geometry in
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .edgesIgnoringSafeArea(.all)
                .opacity(blurAlph)
                .animation(.easeInOut(duration: 0.5), value: enable)
            
            AniButtonView(bgColor: AppModuleType.debt.bgColor, imageName: AppModuleType.debt.symbols) {
                
                enable.toggle()
                debtPresenting.toggle()
                executeAnimation()
            }
            .sheet(isPresented: $debtPresenting, content: {
                sheetAction(.debt)
            })
            .rotationEffect(.degrees(featuresRotation))
            .scaleEffect(featuresScale)
            .position(x: geometry.size.width + offset.x, y: geometry.size.height + offset.y)
            .offset(x: debtOffset.x, y: debtOffset.y)
            .animation(.easeInOut(duration: 0.5), value: enable)
            
            
            
            AniButtonView(bgColor: AppModuleType.record.bgColor, imageName: AppModuleType.record.symbols) {
                enable.toggle()
                recordPresenting.toggle()
                executeAnimation()
            }
            .sheet(isPresented: $recordPresenting, content: {
                sheetAction(.record)
            })
            .rotationEffect(.degrees(featuresRotation))
            .scaleEffect(featuresScale)
            .position(x: geometry.size.width + offset.x, y: geometry.size.height + offset.y)
            .offset(x: recordOffset.x, y: recordOffset.y)
            .animation(.easeInOut(duration: 0.5), value: enable)
            
            AniButtonView(bgColor: AppModuleType.plan.bgColor, imageName: AppModuleType.plan.symbols) {
                enable.toggle()
                planPresenting.toggle()
                executeAnimation()
            }
            .sheet(isPresented: $planPresenting, content: {
                sheetAction(.plan)
            })
            .rotationEffect(.degrees(featuresRotation))
            .scaleEffect(featuresScale)
            .position(x: geometry.size.width + offset.x, y: geometry.size.height + offset.y)
            .offset(x: planOffset.x, y: planOffset.y)
            .animation(.easeInOut(duration: 0.5), value: enable)
            
            AniButtonView(bgColor: .blue.opacity(0.8), imageName: "command") {
                enable.toggle()
                executeAnimation()
            }
            .buttonStyle(StaticButtonStyle())
            .rotationEffect(.degrees(actionRotation))
            .scaleEffect(actionScale)
            .position(x: geometry.size.width + offset.x, y: geometry.size.height + offset.y)
            .animation(.easeInOut(duration: 0.5), value: enable)
            
        }
    }
}

/// 取消Button 点击高亮样式
struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}


struct AniButtonView: View {
    
    var bgColor: Color
    var imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            Image(systemName: imageName)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .background(bgColor)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
        .background(Color.clear)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

