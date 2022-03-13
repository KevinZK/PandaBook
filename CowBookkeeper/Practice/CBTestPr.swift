//
//  CBTestPr.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/13.
//

import SwiftUI


struct CBTestPr: View {
    @State private var progress: Double = 1.0
    var body: some View {
        
        
        
        NavigationView {
            
            VStack {
                ScrollView {
                    VStack(spacing: 10) {
                        CornerRadiusImage()
                        CornerRadiusBg()
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .clipShape(Circle())
                            .offset(x: 100)
                            .shadow(radius: 3)
                        Spacer()
                    }
                    Text("Example")
                }
                .navigationBarTitle("title")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarColor(.blue)
            }
            .background(Color.yellow)
            
        }
        
        
        
        
    }
}

struct CBTestPr_Previews: PreviewProvider {
    static var previews: some View {
        CBTestPr()
    }
}

struct CornerRadiusImage: View {
    var body: some View {
        
        Image("today_bg_img")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .frame(width: ScreenW-40, height: 200)
            .shadow(radius: 4)
        
    }
}

struct CornerRadiusBg: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 24, style: .continuous)
            .fill(Color.green)
            .frame(width: ScreenW-40, height: 100)
            .shadow(radius: 3)
    }
}

struct MyCustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let percent = Int(configuration.fractionCompleted! * 100)
        return  Text("Task \(percent)% Complete")
    }
}

struct NavigationBarModifier: ViewModifier {
    
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
        
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {
    
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
    
}
