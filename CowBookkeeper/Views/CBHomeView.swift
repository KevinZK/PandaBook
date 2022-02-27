//
//  CBHomeView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/8.
//

import SwiftUI
import SwiftUICharts

struct CBHomeView: View {
    
    var data = [1,2,3,4,5,6,7]
    var body: some View {
        
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    
                    TodayWidgetOfHome()
                        .padding(.top, 10)
                    DebtWidgetOfHome()
                        .padding(.top, 10)
                    Text("最近账单")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .padding(.top,10)
                        .font(.system(size: 26, weight: .medium))
                    ForEach(data, id: \.self) { _ in
                        AssetsRecodsRowOfHome()
                    }
                    
                    
                }
                .navigationTitle("Panda 记账")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button( action: {
                            
                        }) {
                            Image(systemName: "aspectratio")
                                .font(.system(size: 24.0, weight: .bold))
                                .foregroundColor(Color(hex: 0x14213d))
                        }
                    }
                    
                }
                CommandButton(offset: UnitPoint(x: -50, y: -150)) { type in
                    CBRecordView(viewModel: RecordDeploy(type))
                }
                
            }
            
        }
        
        
    }
}

struct CBHomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        CBHomeView()
    }
}


struct IconTitleWidget: View {
    var iconName: String
    var titleName: String
    var iconBackgroundColor: Color
    var iconForegroundColor: Color
    var titleColor: Color
    var subTitle: String
    var body: some View {
        HStack(alignment: .center,
               spacing: 10.0) {
            Image(systemName: iconName)
                .font(.system(size: 20.0))
                .padding(10)
                .background(iconBackgroundColor)
                .foregroundColor(iconForegroundColor)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(titleName)
                    .font(.system(size: 24.0))
                    .bold()
                    .foregroundColor(titleColor)
                Text(subTitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding(.leading,10)
    }
}

struct DebtWidgetOfHome: View {
    
    var body: some View {
        HStack(spacing: 13) {
            VStack(alignment: .leading) {
                IconTitleWidget(iconName: AppModuleType.debt.symbols, titleName: AppModuleType.debt.title, iconBackgroundColor: AppModuleType.debt.bgColor, iconForegroundColor: .white, titleColor: .black, subTitle: AppModuleType.debt.subheadline)
                    .padding(.top, 10)
                Text("￥12760")
                    .font(.custom("Helvetica Neue", size: 35))
                    .bold()
                    .foregroundColor(Color(hex: 0x2a9d8f))
                    .padding(.leading,10)
                    .padding(.top, -2)
                Spacer()
            }
            .frame(width: ScreenW*0.45, height: 120)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            VStack(alignment: .leading) {
                IconTitleWidget(iconName: AppModuleType.plan.symbols, titleName: AppModuleType.plan.title, iconBackgroundColor: AppModuleType.plan.bgColor, iconForegroundColor: .white, titleColor: .black, subTitle: AppModuleType.plan.subheadline)
                    .padding(.top, 10)
                HStack(alignment:.firstTextBaseline) {
                    Image(systemName:"chevron.compact.right")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.blue)
                        .padding(.leading, 10)
                        .padding(.trailing,-5)
                    Text("买车")
                        .font(.title2)
                        .padding(.top, 8)
                    
                    Spacer()
                    Text("35万")
                        .font(.title2)
                        .padding(.trailing, 10)
                }.padding(.top,-8)
                ProgressView(value: 50.0, total: 100.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                    .padding(.top, -5)
                Spacer()
            }
            .frame(width: ScreenW*0.45, height: 120)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
        }
    }
}


struct TodayWidgetOfHome: View {
    var body: some View {
        VStack(alignment: .leading) {
            IconTitleWidget(iconName: AppModuleType.today.symbols, titleName: AppModuleType.today.title, iconBackgroundColor: AppModuleType.today.bgColor, iconForegroundColor: Color.white, titleColor: Color.black, subTitle: AppModuleType.today.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                .padding(.leading, 4)
            
            TodayChartOfHome()
        }
        .frame(width: ScreenW*0.93, height: 220)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        
    }
}

struct AssetsRecodsRowOfHome: View {
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "heart")
                    .font(.system(size: 20))
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 3)
                
                VStack(alignment: .leading) {
                    Text("宠物猫粮")
                        .font(.title2)
                    Text("02/16/2022")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Text("345.9￥")
            }
            .padding(.leading)
            .padding(.trailing)
            
            
            Divider().padding(.leading).padding(.trailing)
        }
        .frame(height: 64)
    }
}

struct TodayChartOfHome: View {
    var body: some View {
        HStack{
            RingsChart()
                .data([34.0, 56.0])
                .chartStyle(ChartStyle(backgroundColor: Color(hex: 0xf8f9fa),foregroundColor: [ColorGradient( Color(hex: 0x92FFDE),.green),ColorGradient(.orange,.red)]))
                .frame(width: 120, height: 120)
                .padding(.leading,40)
                .padding(.trailing, 50)
            
//            Spacer()
            VStack(alignment: .trailing){
                HStack{
                    Spacer()
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0x92FFDE), .green]),startPoint: .top,endPoint: .bottom))
                        .frame(width: 20, height: 20)
                    
                    Text("支出")
                        .font(Font.title3)
                    
                }
                
                
                Text("￥633.84万")
                    .font(.custom(FontFamily.SFT.rawValue, size: 20))
                    .bold()
                    .frame( maxWidth: 120)
                    .lineLimit(1)
                    .multilineTextAlignment(.trailing)
                    .fixedSize()
                
                
                HStack{
                    Spacer()
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.orange, .red]),startPoint: .top,endPoint: .bottom))
                        .frame(width: 20, height: 20)
                    
                    Text("收入")
                        .font(Font.title3)
                }
                Text("￥1999.1万")
                    .font(.custom(FontFamily.SFT.rawValue, size: 20))
                    .bold()
                    .frame( maxWidth: 120)
                    .lineLimit(1)
                
            }
            
        }
        .fixedSize()
        .padding(.bottom, 20)
    }
}

